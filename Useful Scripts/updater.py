# Python 3.5.1 - Written by robtherad
import filecmp, os, os.path, shutil

def update_missions(oldTemplate, newTemplate, oldMission, newMission):
    '''
    update_missions(oldTemplate, newTemplate, oldMission, newMission)
    Get diff between oldTemplate and newTemplate, get list of mismatched files
    '''
    oldTemplateList = build_directory(oldTemplate)
    if type(oldTemplateList) is bool: raise AssertionError
    
    newTemplateList = build_directory(newTemplate)
    if type(newTemplateList) is bool: raise AssertionError
    
    differentTemplateFiles = compare_directories([oldTemplateList, newTemplateList],[oldTemplate, newTemplate])
    # TODO: Add check to make sure the two templates are actually different
    # Get diff between oldTemplate and oldMission.

    oldMissionList = build_directory(oldMission)
    if type(oldMissionList) is bool: raise AssertionError
    
    differentMissionFiles = compare_directories([oldTemplateList, oldMissionList],[oldTemplate, oldMission])

    # Determine which files to copy and which to throw a merge warning for
    filesToWorkWith = sort_files(differentTemplateFiles, differentMissionFiles)

    # File operations
    copy_files(filesToWorkWith[1], newTemplate, newMission)
    print()
    warn_files(filesToWorkWith[0], newTemplate, newMission)
    
def build_directory(path):
    '''
    build_directory(path)
    Given a path, generates a list of files under that path
    '''
    # TODO: Add a check to make sure these are mission folders. Check for init.sqf, mission.sqm, and description.ext in root folder
    fileList = []
    dirList = []
    for root, dirs, files in os.walk(path):
        rel_path = (root.split(path))[1]
        if rel_path == "":
            if not "mission.sqm" in files:
                print("This is not a mission folder! Abort!")
                return False
        for f in files:
            fileList.append(''.join([rel_path,'\\',f]))
        for d in dirs:
            dirList.append(d)
    return fileList
            
def compare_directories(fileLists, directoryPaths):
    '''
    compare_directories(fileLists, directoryPaths)
    Compares the files in two directories and puts aside any mismatches. Then compares common files to see if their contents are the same.
        
    REGEX for fixing files if they are a mix of unix and windows types: (\r?\n)|(\r\n?)
    '''
    # Unpack vars
    firstList = fileLists[0]
    secondList = fileLists[1]
    firstDir = directoryPaths[0]
    secondDir = directoryPaths[1]
    
    # Strip out any files that are only in one directory and not the other
    commonList = []
    mismatchList = []
    secondListMismatch = []
    for i in firstList:
        if i in secondList:
            commonList.append(i)
        else:
            mismatchList.append(i)
    for i in secondList:
        if not i in commonList:
             secondListMismatch.append(i)
    
    # Compare files present in both directories
    passedList = []
    failedList = []
    for file in commonList:
        value = filecmp.cmp(''.join([firstDir,file]), ''.join([secondDir,file]), shallow=True)
        if value == True:
            passedList.append(file)
        else:
            failedList.append(file)

    # TODO: Add bool toggle for returning less variables
    return [failedList, passedList, mismatchList, secondListMismatch, commonList]

def sort_files(templateDiffs, missionDiff):
    '''
    sort_files(templateDiffs, missionDiff)
    Determines which files to copy and which to warn about.
    Diffs are passed as lists: [failedList, mismatchList, secondMistmatch, commonList]
    
    Warn about: 
        1. Files that were changed in the old mission and changed between the old template and the new template
    Copy:
        2. Files that were changed in the old mission but didn't change between the old template and the new template
        3. Files that weren't changed in the old mission and weren't changed between the old template and the new template.
        4. Files that weren't changed in the old mission and were changed between the old template and the new template.
    '''
    copyFiles = []
    warnFiles = []
    
    # Files that weren't in the old template but are in the new template are auto copied.
    newTemplateFiles = templateDiffs[3]
    if len(newTemplateFiles) > 0:
        copyFiles.append(newTemplateFiles)

    # Common files that haven't changed from the old template to the new template and unchanged in mission are copied
    failedBtwnTemplates = templateDiffs[0] #Diff btwn old temp and new temp
    commonBtwnMission = missionDiff[1] #Same from old temp to old mission
    failedBtwnMission = missionDiff[0] #Diff btwn old temp and old mission
    commonBtwnTemplates = templateDiffs[1] #Same from old temp to new temp

    # Copy all files that weren't changed from the old template in either the old mission or the new template
    # Only copy rest of files if it's any empty directory, if it's overwriting old mission then no need
    for f in commonBtwnMission:
        if f in commonBtwnTemplates:
            # -- 3 --
            copyFiles.append(f)
    # Copy all files that were changed in the old mission that weren't changed in the new template
    for f in failedBtwnMission:
        if (f in commonBtwnTemplates):
            # -- 2 --
            # Copy all files that were changed in the old mission that weren't changed in the new template
            copyFiles.append(f)
        else:
            # -- 1 --
            # Warn all files that were changed in old mission and changed in new template
            warnFiles.append(f)
            
    for f in failedBtwnTemplates:
        if f in commonBtwnMission:
            # -- 4 --
            # Files that weren't changed in the old mission and were changed between the old template and the new template.
            copyFiles.append(f)
    for l in [failedBtwnTemplates, commonBtwnMission, failedBtwnMission, commonBtwnTemplates]:
        for f in l:
            if not f in copyFiles:
                if not f in warnFiles:
                    print("ORPHAN FILE!: ",f)
    return [warnFiles, copyFiles]

def warn_files(files, sourcePath, destPath):
    print("========================================================")
    print("----------Files that have to be manually merged---------")
    print("========================================================")
    for f in files:
        print("- ",f)
    
def copy_files(filesToCopy, sourcePath, destPath):
    # Copy files from new template into old mission
    # TODO: Add a thing to make sure directory is clear first. ASK before deleting anything.
    # filesToCopy is a list of relative file paths of things that need to be copied
    
    # Check that the directory is clear
    for root, dirs, files in os.walk(destPath):
        if len(dirs) > 0 or len(files) > 0:
            test = 1
            #print ("ERROR: New mission directory is not empty! Aborting.")
            #raise AssertionError
    # TODO: Add an option to copy files anyway
    copyCount = 0
    # Copy files
    for f in filesToCopy:
        fileSource = ''.join([sourcePath,f])
        # Get directory that copied file should be placed in
        fileDest = (''.join([destPath,f])).rsplit(sep='\\', maxsplit=1)
        # Make sure directory exists in the new mission folder
        if not os.path.exists(fileDest[0]):
            os.makedirs(fileDest[0])
        
        shutil.copy(fileSource, fileDest[0])
        copyCount = copyCount + 1
    print("Finished copying", copyCount, "file(s).")
    print("From:", sourcePath)
    print("  To:", destPath)

# TODO: Create GUI to easily enter folders into
'''
GUI will be 4 file browser fields for selecting the 3 input folders and an output folder.
Big text box at the bottom for outputting info about merge conflicts, etc.

Ideas:
 Create a checkbox to disable creating a new mission, merge everything into the old mission's folder instead.
 Create a way to set up a list of missions and update them all at once. Save merge conflicts to a text file in the root of the mission folder?
 If newMission path isn't set, prompt to overwrite old mission instead
'''

oldTemplate = 'C:\\Users\\Rob\\Desktop\\oldTemplate\\ADV120_MissionTemplate.Altis'
newTemplate = 'C:\\Users\\Rob\\Desktop\\newTemplate\\ADV120_MissionTemplate.Altis'
oldMission = 'C:\\Users\\Rob\\Desktop\\oldMission\\ADV120_MissionTemplate.Altis'
newMission = 'C:\\Users\\Rob\\Desktop\\newMission\\ADV120_MissionTemplate.Altis'

update_missions(oldTemplate, newTemplate, oldMission, newMission)
