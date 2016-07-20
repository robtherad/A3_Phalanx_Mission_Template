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

# -----
# Update missions functions
def update_missions():
    '''
    Handles updating an old mission to a new template version.
    '''
    
    oldMission = get_input_path("Enter the path of the mission you wish to update: ", True)
    oldTemplate = get_input_path("Enter the path of the template used to create that mission: ", True)
    newTemplate = get_input_path("Enter the path of the NEW template that you will update your mission with: ", True)
    newMission = get_input_path("Enter the path where you would like the updated mission to be created: ", False)

    confirm_inputs(oldMission, oldTemplate, newTemplate, newMission)
    
    oldTemplateList = build_directory(oldTemplate)  
    newTemplateList = build_directory(newTemplate)
    differentTemplateFiles = compare_directories([oldTemplateList, newTemplateList],[oldTemplate, newTemplate])
    
    oldMissionList = build_directory(oldMission)
    differentMissionFiles = compare_directories([oldTemplateList, oldMissionList],[oldTemplate, oldMission])

    # Determine which files to copy and which to throw a merge warning for
    filesToWorkWith = sort_files(differentTemplateFiles, differentMissionFiles)

    copy_files_main(filesToWorkWith[1], newTemplate, oldMission, newMission)
    warn_files(filesToWorkWith[0])
    
    print()
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    print()
    get_input()

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
            if not ( ("mission.sqm" in files) or ("description.ext" in files) or ("init.sqf" in files) or ("f" in dirs) or ("description" in dirs) or ("scripts" in dirs) ):
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
    Diffs are passed as lists: [failedList, passedList, mismatchList, secondListMismatch, commonList]  
    
    Warn about: 
        5. Files changed between old template and old mission AND changed between old template and new template
    Copy:
        1. Files unique to the old mission
        2. Files unique to the new template
        4. Files changed between the old template and old mission AND NOT changed between the old template and new template
        6. Files NOT changed between the old template and old mission AND changed between the old template and new template
        8. Files NOT changed between the old template and old mission AND NOT changed between the old template and newtemplate
    Ignore:
        3. Files that are unique to the old template
        7. Files that don't exist in the old mission AND changed between the old template and new template
        9. Files common between templates AND don't exist in the old mission
    '''
    copyNewFiles = [] # Files that come from the new template
    copyOldFiles = [] # Files that come from the old mission/template
    warnFiles = []
    orphanFiles = []

    # [failedList, passedList, mismatchList, secondListMismatch, commonList]  
    failedBtwnTemplates = templateDiffs[0] # Diff btwn old temp and new temp
    commonBtwnTemplates = templateDiffs[1] # Same from old temp to new temp
    uniqueOldTemplate = templateDiffs[2] # Files unique to the old template
    uniqueNewTemplate = templateDiffs[3] # Files unique to the new template
    
    failedBtwnMission = missionDiff[0] # Diff btwn old temp and old mission
    commonBtwnMission = missionDiff[1] # Same from old temp to old mission
    uniqueOldMission = missionDiff[3] # Files unique to the old mission

    for f in uniqueOldMission:
        # -- 1 --
        # Copy files that are unique to the old mission (compared to the old template)
            copyOldFiles.append(f)

    for f in uniqueNewTemplate:
        # -- 2 --
        # Copy files that are unique to the new template (compared to the old template)
            copyNewFiles.append(f)

    for f in uniqueOldTemplate:
        # -- 3 --
        # Ignore files that are unique to the old template (compared to the new template)
            orphanFiles.append(f)
            
    for f in failedBtwnMission:
        if f in commonBtwnTemplates:
            # -- 4 --
            # Files changed between the old template and old mission AND NOT changed between the old template and new template
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 4 Already registered - Please report!:: ", f)
            else:
                copyOldFiles.append(f)
        elif f in failedBtwnTemplates:
            # -- 5 --
            # Files changed between old template and old mission AND changed between old template and new template - manual merge required
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 5 Already registered - Please report!:: ", f)
            else:
                warnFiles.append(f)
            
    for f in failedBtwnTemplates:
        if f in commonBtwnMission:
            # -- 6 --
            # Files NOT changed between the old template and old mission AND changed between the old template and new template
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 6 Already registered - Please report!:: ", f)
            else:
                copyNewFiles.append(f)
        elif not ((f in missionDiff[3]) or (f in missionDiff[4])):
            # -- 7 --
            # Files that don't exist in the old mission AND changed between the old template and new template
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 7 Already registered - Please report!:: ", f)
            else:
                orphanFiles.append(f)

    for f in commonBtwnMission:
        if f in commonBtwnTemplates:
            # -- 8 --
            # Files NOT changed between the old template and old mission AND NOT changed between the old template and newtemplate
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 8 Already registered - Please report!:: ", f)
            else:
                copyNewFiles.append(f)
            
    for f in commonBtwnTemplates:
        if not ((f in missionDiff[3]) or (f in missionDiff[4])):
            # -- 9 --
            # Files common between templates AND don't exist in the old mission
            if f in copyNewFiles or f in copyOldFiles or f in warnFiles or f in orphanFiles:
                print(" ERROR: 9 Already registered - Please report!:: ", f)
            else:
                orphanFiles.append(f)

    # Find any files that should have been copied/warned about and werent - Display a warning for each
    for index, diffList in enumerate([templateDiffs, missionDiff]):
        for secondIndex, fileList in enumerate(diffList):
            for file in fileList:
                if not ((file in copyNewFiles) or (file in copyOldFiles) or (file in warnFiles) or (file in orphanFiles)):
                        print(" WARNING - ORPHAN FILE!: ",file)
                        orphanFiles.append(file)
    print()
    print()
    print("Ignored",len(orphanFiles),"files.")
    return [warnFiles, [copyOldFiles, copyNewFiles]]

def warn_files(files):
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
    
    print("Copied",countNew,"files from New Template:   ",sourceNewPath)
    print("Copied",countOld,"files from Old Mission:   ",sourceOldPath)
    print("To New Mission:   ", destPath)

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
        
def diff_missions():
    missionOne = get_input_path("Enter the path of the first mission folder: ", True)
    missionTwo = get_input_path("Enter the path of the second mission folder: ", True)
    
    missionOneList = build_directory(missionOne)
    missionTwoList = build_directory(missionTwo)
    
    filesList = compare_directories([missionOneList, missionTwoList], [missionOne, missionTwo])
    
    # filesList = [failedList, passedList, mismatchList, secondListMismatch, commonList]
    print()
    print("Common files with matching contents:", len(filesList[1]),"files")
    print("------------------------------------------------------------")
    print("Common files with different contents:", len(filesList[0]),"files")
    print()
    for f in (filesList[0]):
        print(" ", f)
    print("------------------------------------------------------------")
    print("Files present in first mission folder but not second folder: ", len(filesList[2]),"files")
    print(missionOne)
    print()
    for f in (filesList[2]):
        print(" ", f)
    print("------------------------------------------------------------")
    print("Files present in second mission folder but not first folder: ", len(filesList[3]),"files")
    print(missionTwo)
    print()
    for f in (filesList[3]):
        print(" ", f)
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    print()
    get_input()

def get_input_path(inputText, mustExist):
    '''
    Gets a path input from the user and checks to see if it's a mission directory. If it's not it asks again. If it is it returns the the inputted path.
    '''
    userInput = input(inputText)
    
    if (not os.path.exists(userInput)) and (mustExist == True):
        print(" ERROR: Path is invalid. Enter a valid path.")
        get_input_path(inputText, mustExist)
    
    for root, dirs, files in os.walk(userInput):
        if mustExist == True:
            # Path must exist, and must be a mission folder if it does exist
            if len(dirs) > 0 or len(files) > 0:
                # Path not empty, check for mission file
                if not ( ("mission.sqm" in files) or ("description.ext" in files) or ("init.sqf" in files) or ("f" in dirs) or ("description" in dirs) or ("scripts" in dirs) ):
                    # No mission file in path, get new path.
                    print(" ERROR: Path is not a mission directory.")
                    get_input_path(inputText)
                else:
                    # Everything is working as it should, stop iterating through the directories
                    break
            else:
                # Path empty, get new path from user.
                print(" ERROR: Path is empty. Please enter a valid, non empty, path.")
                get_input_path(inputText, mustExist)
        else:
            # Path should be empty, but prompt user to continue anyway if it isn't
            if len(dirs) > 0 or len(files) > 0:
                # Path isn't empty
                response = input(" WARNING: New mission folder is not empty! Do you wish to continue anyway? All existing files in this directory will be lost (Y\\N): ")
                if not ((response.lower() == "y") or (response.lower() == "yes")):
                    print(" User entered value that did not equal yes, exiting...")
                    sys.exit()
                else:
                    # User is ok with overwriting stuff, stop iterating through the directories
                    delete_dir(userInput)
                    break
            else:
                # Everything is working as it should, stop iterating through the directories
                break
    return userInput

def program_init():
    print("==================================================")
    print("======= PHX Mission Tool v1 - by robtherad =======")
    print("==================================================")
    get_help()

def get_help():
    '''
    The main part of the program that lets the user decide what to do.
    '''
    print()
    print(" Commands")
    print("  d(iff) - Find out which files are different between two missions")
    print("  h(elp) - Lists commands and what they do")
    print("  u(pdate) - Update an old mission to a new template version")
    print()
    get_input()

def get_input():
    userInput = input("What would you like to do? >>> ")
    if ((userInput.lower() == "e") or (userInput.lower() == "exit")):
        sys.exit()
    elif ((userInput.lower() == "h") or (userInput.lower() == "help")):
        get_help()
    elif ((userInput.lower() == "u") or (userInput.lower() == "update")):
        update_missions()
    elif ((userInput.lower() == "d") or (userInput.lower() == "diff")):
        diff_missions()
    else:
        print("Unrecognized input. Type h or help to see a list of commands.")
        get_input()

program_init()
