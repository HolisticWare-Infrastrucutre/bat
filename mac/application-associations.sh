#!/bin/bash

brew install duti

# osascript -e 'id of app "AppName"'

osascript -e 'id of app "Xamarin Studio"'
osascript -e 'id of app "Visual Studio"'
osascript -e 'id of app "Unarchive"'

open \
    http://apple.stackexchange.com/questions/91522/change-file-association-in-terminal \
    http://superuser.com/questions/273756/how-to-change-default-app-for-all-files-of-particular-file-type-through-terminal


echo \
"
<dict>
  <key>LSHandlerContentType</key>
  <string>com.adobe.pdf</string>
  <key>LSHandlerRoleAll</key>
  <string>net.sourceforge.skim-app.skim</string>
</dict>
"
echo \
"
<dict>
  <key>LSHandlerContentTag</key>
  <string>mkv</string>
  <key>LSHandlerContentTagClass</key>
  <string>public.filename-extension</string>
  <key>LSHandlerRoleAll</key>
  <string>org.videolan.vlc</string>
</dict>
"

code 
