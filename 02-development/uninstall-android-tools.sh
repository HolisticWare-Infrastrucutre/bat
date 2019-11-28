#!/bin/bash

rm -Rf /Applications/Android\ Studio.app

cd ~/Library/Android/sdk/extras/intel/Hardware_Accelerated_Execution_Manager/
chmod +x silent_install.sh
./silent_install.sh -u
sudo /Library/Extensions/intelhaxm.kext/Contents/Resources/uninstall.sh

rm -Rf ~/Library/Preferences/AndroidStudio*
rm ~/Library/Preferences/com.google.android.studio.plist
rm -Rf ~/Library/Application\ Support/AndroidStudio*
rm -Rf ~/Library/Logs/AndroidStudio*
rm -Rf ~/Library/Caches/AndroidStudio*
if you would like to delete all projects:

# to remove gradle related files (caches & wrapper)
rm -Rf ~/AndroidStudioProjects

# use the below command to delete all Android Virtual Devices(AVDs) and *.keystore. 
# note: this folder is used by others Android IDE as well, so if you still using other 
# IDE you may not want to delete this folder)
rm -Rf ~/.gradle

# to delete Android SDK tools
rm -Rf ~/.android

rm -Rf ~/Library/Android*



# Cache related files live in:

~/Library/Caches OR /Library/Caches
~/Library/Containers/[App Name]/Data/Library/Caches/[App Name]
~/Library/Saved Application State

# Most preference files live in one of the following spots:

~/Library/Preferences OR /Library/Preferences
~/Library/Application Support/[App or Developer name] 
/Library/Application Support/[App or Developer name]
~/Library/Containers/[App name]/Data/Library/Preferences


~/Libarary/Logs 
/Library/Logs