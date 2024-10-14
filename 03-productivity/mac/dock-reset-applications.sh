#!/bina/bash

defaults delete com.apple.dock

defaults delete com.apple.dock \
    recent-apps

defaults delete com.apple.dock \
    persistent-others

rm -fr $HOME/Library/Preferences/com.apple.dock.plist

killall Dock

# https://lupin3000.github.io/macOS/defaults/

# https://stackoverflow.com/questions/69182320/add-applications-folder-to-dock-using-terminal-macos

# To reset all the settings for com.apple.dock you can do the following:
# 
# 
# 
# defaults delete com.apple.dock && killall Dock
# 
# 
# Be careful entering commands you do not understand.  There are built-in manual pages and typing "man defaults" will explain the options of the command.  
# 
# 
# 
# The com.apple.dock.plist is kept in ~/Library/Preferences and the defaults command knows where to find it.  So the command was saying to write new keys and options to the XML Plist configuration file named com.apple.dock.plist.  Since you are creating an array it's likely easier to remove everything configured on the Dock.  Then you can redo the settings you wish to implement.  
# 
# 
# 
# Another option would be to delete the ~/Library/Preferences/com.apple.dock.plist file and then issue the "killall Dock" command to restart the Dock.  It will regenerate the default settings and recreate the plist file.  


