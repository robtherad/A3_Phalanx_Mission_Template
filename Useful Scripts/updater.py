'''
updater.py - Python 3.5.1 - Written by robtherad

Used for updating missions made by an older mission template version.

Get's the difference between the mission and the template that it was made from as well as the difference between the template it was made from and the template you wish to update it to. 
The script will automatically apply any changes that it can to your mission and give you a list of files that you will need to manually update in order to bring your mission up to date with the latest template changes.

Known problems:

- Some files are the same except for one version uses unix newlines and the other version uses windows newlines.
 These files will report as different and might require manual merging.
 Use the folow regex to find and then replace all newlines with a single type. Mission.sqm uses windows (\r\n)
 (\r?\n)|(\r\n?)
'''
import filecmp, os, os.path, shutil, sys

def update_missions(oldTemplate, newTemplate, oldMission, newMission):
    '''
    Get diff between oldTemplate and newTemplate, get list of mismatched files
    '''
    oldTemplateList = build_directory(oldTemplate)  
    newTemplateList = build_directory(newTemplate)
    differentTemplateFiles = compare_directories([oldTemplateList, newTemplateList],[oldTemplate, newTemplate])
    
    oldMissionList = build_directory(oldMission)
    differentMissionFiles = compare_directories([oldTemplateList, oldMissionList],[oldTemplate, oldMission])

    # Determine which files to copy and which to throw a merge warning for
    filesToWorkWith = sort_files(differentTemplateFiles, differentMissionFiles)

    copy_files_main(filesToWorkWith[1], newTemplate, oldMission, newMission)
    warn_files(filesToWorkWith[0], newTemplate, oldMission, newMission)

def build_directory(path):
    '''
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

    return [failedList, passedList, mismatchList, secondListMismatch, commonList]

def sort_files(templateDiffs, missionDiff):
    '''
    Determines which files to copy and which to warn about.
    Diffs are passed as lists: [failedList, mismatchList, secondMistmatch, commonList]
    
    Warn about: 
        1. Files that were changed in the old mission and changed between the old template and the new template
    Copy:
        2. Files that were changed in the old mission but didn't change between the old template and the new template -- copyOldFiles
        3. Files that weren't changed in the old mission and weren't changed between the old template and the new template -- copyNewFiles
        4. Files that weren't changed in the old mission and were changed between the old template and the new template -- copyNewFiles
    '''
    copyNewFiles = []
    copyOldFiles = []
    warnFiles = []

    # Common files that haven't changed from the old template to the new template and unchanged in mission are copied
    failedBtwnTemplates = templateDiffs[0] # Diff btwn old temp and new temp
    commonBtwnMission = missionDiff[1] # Same from old temp to old mission
    failedBtwnMission = missionDiff[0] # Diff btwn old temp and old mission
    commonBtwnTemplates = templateDiffs[1] # Same from old temp to new temp

    for f in commonBtwnMission:
        if f in commonBtwnTemplates:
            # -- 3 --
            # Files that weren't changed in the old mission and weren't changed between the old template and the new template.
            copyNewFiles.append(f)

    for f in failedBtwnMission:
        if (f in commonBtwnTemplates):
            # -- 2 --
            # Files that were changed in the old mission but didn't change between the old template and the new template.
            copyOldFiles.append(f)
        else:
            # -- 1 --
            # Files that were changed in the old mission and changed between the old template and the new template.
            warnFiles.append(f)
            
    for f in failedBtwnTemplates:
        if f in commonBtwnMission:
            # -- 4 --
            # Files that weren't changed in the old mission and were changed between the old template and the new template.
            copyNewFiles.append(f)

    # Find any files that should have been copied/warned about and werent - Display a warning for each
    for l in [failedBtwnTemplates, commonBtwnMission, failedBtwnMission, commonBtwnTemplates]:
        for f in l:
            if not ((f in copyNewFiles) or (f in copyOldFiles)):
                if not f in warnFiles:
                    print("WARNING - ORPHAN FILE!: ",f)
    
    return [warnFiles, [copyOldFiles, copyNewFiles]]

def warn_files(files, sourceNewPath, sourceOldPath, destPath):
    '''
    Displays a warning for each file that needs to be manually merged into the new mission.
    '''
    if len(files) > 0:
        print("========================================================")
        print("----------Files that have to be manually merged---------")
        print("========================================================")
        for f in files:
            print("- ",f)
    else:
        print("========================================================")
        print("- No files need to be manually merged. Congratulations -")
        print("========================================================")

def copy_files_main(filesToCopy, sourceNewPath, sourceOldPath, destPath):
    '''
    Copies files from the old mission and the new template into the new mission folder.
    
    filesToCopy is a list containing two sub lists.
    Each sub-list contains relative file paths of things that need to be copied.
    The first sub-list is for the Old Mission.
    The second sub-list is for the New Template.
    '''   
    countOld = copy_files_sub(filesToCopy[0], sourceOldPath, destPath)
    countNew = copy_files_sub(filesToCopy[1], sourceNewPath, destPath)
    
    print("Copied",countNew,"files from New Template:",sourceNewPath)
    print("Copied",countOld,"files from Old Mission:",sourceOldPath)
    print("To New Mission:", destPath)

def copy_files_sub(files, sourcePath, destPath):
    copyCount = 0
    for f in files:
        fileSource = ''.join([sourcePath,f])
        fileDest = (''.join([destPath,f])).rsplit(sep='\\', maxsplit=1)
        if not os.path.exists(fileDest[0]):
            os.makedirs(fileDest[0])
        shutil.copy(fileSource, fileDest[0])
        copyCount = copyCount + 1
    return copyCount
    
def get_input_path(inputText, mustExist):
    userInput = input(inputText)
    
    for root, dirs, files in os.walk(userInput):
        if mustExist == True:
            # Path must exist, and must be a mission folder if it does exist
            if len(dirs) > 0 or len(files) > 0:
                # Path not empty, check for mission file
                if not "mission.sqm" in files:
                    # No mission file in path, get new path.
                    print("ERROR: Path is not a mission directory. No mission.sqm file found.")
                    get_input_path(inputText)
                else:
                    # Everything is working as it should, stop iterating through the directories
                    break
            else:
                # Path empty, get new path from user.
                print(" ERROR: Path seems to be empty. Please enter a valid path.")
                get_input_path(inputText)
        else:
            # Path should be empty, but prompt user to continue anyway if it isn't
            if len(dirs) > 0 or len(files) > 0:
                # Path isn't empty
                response = input(" WARNING: New mission folder is not empty! Do you wish to continue anyway? All existing files in this directory will be lost (Y\\N): ")
                if not ((response.lower() == "y") or (response.lower() == "yes")):
                    print("User entered value that did not equal yes, exiting...")
                    sys.exit()
                else:
                    # User is ok with overwriting stuff, stop iterating through the directories
                    delete_dir(userInput)
                    break
            else:
                # Everything is working as it should, stop iterating through the directories
                break
    return userInput

def delete_dir(directory):
    '''
    Deletes a given directory, but only if it's a mission directory, and displays a message.
    '''
    
    for root, dirs, files in os.walk(directory):
        rel_path = (root.split(directory))[1]
        if rel_path == "":
            if not ( ("mission.sqm" in files) or ("description.ext" in files) or ("init.sqf" in files) or ("f" in dirs) or ("description" in dirs) or ("scripts" in dirs) ):
                print()
                print("ERROR: Couldn't find any mission related files in the New Mission directory, cancelling deletion.")
                print("Either manually make sure the directory is empty or make sure the path is correct.")
                print()
                print("- Exiting program.")
                sys.exit()
            else:
                shutil.rmtree(directory)
                print("Cleared directory: ",directory)
                print()
                break

def confirm_inputs(oldMission, oldTemplate, newTemplate, newMission):
    '''
    Let's user confirm that all inputs are correct before starting any file operations.
    '''
    print("Old Mission Path:",oldMission)
    print("Old Template Path:",oldTemplate)
    print("New Template Path:",newTemplate)
    print("New Mission Path:",newMission)
    print()
    response = input("Are these file paths correct? (Y\\N): ")
    if not ((response.lower() == "y") or (response.lower() == "yes")):
        print("User entered value that did not equal yes, exiting...")
        sys.exit()

# -----
oldMission = get_input_path("Enter the path of the mission you wish to update: ", True)
oldTemplate = get_input_path("Enter the path of the template used to create that mission: ", True)
newTemplate = get_input_path("Enter the path of the NEW template that you will update your mission with: ", True)
newMission = get_input_path("Enter the path where you would like the updated mission to be created: ", False)

confirm_inputs(oldMission, oldTemplate, newTemplate, newMission)

update_missions(oldTemplate, newTemplate, oldMission, newMission)
