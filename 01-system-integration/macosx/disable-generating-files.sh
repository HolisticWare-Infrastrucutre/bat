#/bin/bash

# prevent creating some files
#	TimeMachine
#		.com.apple.timemachine.donotpresent* 

defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES


# disable Spotlight can be disabled with 
mdutil -i off
mdutil -i off /Volumes/Volume
rm -rf /Volumes/Volume/.Spotlight-V100


# Deleting .DS_Store files:
# 		deleting files on the volume in Finder 
find /Volumes/Volume -name .DS_Store -delete

# Trashes (files moved to Trash)
# 	
sudo rm -r /Volumes/Volume/.Trashes; touch /Volumes/Volume/.Trashes

# software:
#		BlueHarvest 

