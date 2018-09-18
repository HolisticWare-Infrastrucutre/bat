#!/bin/bash


open \
    http://apple.stackexchange.com/questions/91522/change-file-association-in-terminal \
    http://superuser.com/questions/273756/how-to-change-default-app-for-all-files-of-particular-file-type-through-terminal

# osascript -e 'id of app "AppName"'

osascript -e 'id of app "Xamarin Studio"'
# com.parallels.winapp.2b97e0e7ea55f0ec1802a67f2e7e5732.6a34994063d64b6dbad60c050ed92de8
osascript -e 'id of app "Visual Studio"'
# com.microsoft.visual-studio

osascript -e 'id of app "Unarchive"'
# com.parallels.toolbox.Unarchive

echo \
"
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
  <dict>
    <key>Label</key>
    <string>com.duti.watcher</string>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/bin/duti</string>
      <string>/Users/$(whoami)/.duti</string>
    </array>
    <key>UserName</key>
    <string>$(whoami)</string>
    <key>KeepAlive</key>
    <false/>
    <key>WatchPaths</key>
    <array>
      <string>/Users/$(whoami)/.duti</string>
    </array>
  </dict>
</plist>
" 

ls -al ~/Library/LaunchAgents/
ls -al /Users/$(whoami)/.duti

brew install duti
launchctl load -F -w ~/Library/LaunchAgents/duti.plist




# echo \
# "
# <dict>
#   <key>LSHandlerContentType</key>
#   <string>com.adobe.pdf</string>
#   <key>LSHandlerRoleAll</key>
#   <string>net.sourceforge.skim-app.skim</string>
# </dict>
# "
# echo \
# "
# <dict>
#   <key>LSHandlerContentTag</key>
#   <string>mkv</string>
#   <key>LSHandlerContentTagClass</key>
#   <string>public.filename-extension</string>
#   <key>LSHandlerRoleAll</key>
#   <string>org.videolan.vlc</string>
# </dict>
# "

# code 
