#Python 2.7
#Renames a bunch of mission folders at once.
#1 - Place this script in your mission directory.
#2 - Edit oldName on line 9 to match the version numbers in your mission's current names
#3 - Edit newName on line 10 to match the version number to change the missions to

import os, sys

oldName = 'v15'
newName = 'v16'

for filename in os.listdir(os.path.dirname(os.path.abspath(__file__))):
    print filename
	tempString = filename.split(oldName)
	if len(tempString) == 2:
		os.rename(filename, tempString[0] + newName + tempString[1])