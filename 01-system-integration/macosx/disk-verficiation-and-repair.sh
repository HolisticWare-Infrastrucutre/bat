#/bin/bash

VOLUME_NAME=disk0s4
fsck_exfat -d $VOLUME_NAME
 
# The -d flag is the debug flag  
# files flashing by and after a while answer question with Yes
#
# 		Main boot region needs to be updated. Yes/No?
#


# http://www.theinstructional.com/guides/disk-management-from-the-command-line-part-1

diskutil list
diskutil info disk2s1

diskutil verifyVolume [drive identifier]
diskutil verifyVolume /