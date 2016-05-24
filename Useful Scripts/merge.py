#Python 2.7
#Copys files from one directory into a bunch of other directories
#How to Use:
#1 - Place this file in your A3 mission directory.
#2 - Edit root_src_dir on line 13 to match the directory where you want to pull files from
#3 - Edit version_number on line 16 to the version number of the missions you want to push files to
#4 - Run script and check to see if files were pushed correctly

import os
import shutil

#Where files are pulled from
root_src_dir = 'C:\\Users\\Rob\\desktop\\v16'

#Determines which folders to push files to
version_number = 'v16'

for filename in os.listdir(os.path.dirname(os.path.abspath(__file__))):
    tempString = filename.split(version_number)
    if len(tempString) == 2:
        root_dst_dir = os.path.dirname(os.path.abspath(filename)) + "\\" + filename
        print "Working with - %s" % root_dst_dir
        for src_dir, dirs, files in os.walk(root_src_dir):
            dst_dir = src_dir.replace(root_src_dir, root_dst_dir, 1)
            if not os.path.exists(dst_dir):
                os.makedirs(dst_dir)
            for file_ in files:
                src_file = os.path.join(src_dir, file_)
                dst_file = os.path.join(dst_dir, file_)
                if os.path.exists(dst_file):
                    os.remove(dst_file)
                shutil.copy2(src_file, dst_dir)