#!/bin/bash

function usage()
{
    echo "Mac OSX customization script - file associations for apps:"
    
}

usage

function app_ids() 
{
    # osascript -e 'id of app "AppName"'
    osascript -e 'id of app "Visual Studio"'
    osascript -e 'id of app "Visual Studio Code"'
    osascript -e 'id of app "Xamarin Studio"'  
    osascript -e 'id of app "Archive Utility"'
    osascript -e 'id of app "Unarchive"'
    osascript -e 'id of app "Luyten"'
    osascript -e 'id of app "Luyten.app"'

    #   com.microsoft.visual-studio
    #   com.microsoft.vscode
    #   com.apple.archiveutility
    #   com.parallels.toolbox.Unarchive

}

app_ids

function duti_install() 
{
  brew install duti
}

function help()
{
  open \
      http://apple.stackexchange.com/questions/91522/change-file-association-in-terminal \
      http://superuser.com/questions/273756/how-to-change-default-app-for-all-files-of-particular-file-type-through-terminal
}

function samples()
{
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
}

function defaults_write()
{
    # com.microsoft.visual-studio
    # com.microsoft.VSCode
    defaults write \
      com.apple.LaunchServices \
      LSHandlers \
      -array '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.microsoft.VSCode;}'

    defaults write \
      com.apple.LaunchServices \
      LSHandlers \
      -array '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.microsoft.VSCode;}'

    defaults write \
      com.apple.LaunchServices \
      LSHandlers \
      -array '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.microsoft.VSCode;}'

}

function defaults_read_into_file()
{
    defaults read \
      com.apple.LaunchServices/com.apple.launchservices.secure \
      LSHandlers \
      > \
      com.apple.launchservices.secure.txt

    defaults read \
      com.apple.LaunchServices/com.apple.launchservices \
      LSHandlers \
      > \
      com.apple.launchservices.txt
}

defaults_read_into_file

function defaults_write_from_file()
{
    defaults write \
      com.apple.LaunchServices/com.apple.launchservices.secure \
      LSHandlers \
      "$(cat com.apple.launchservices.secure.txt)"  
}

function duti_get()
{
    duti -s com.microsoft.VSCode      md
    duti -s com.microsoft.VSCode      txt
    duti -s com.microsoft.VSCode      markdown
    duti -s com.microsoft.VSCode      cs
    duti -s com.microsoft.VSCode      csx
    duti -s com.microsoft.VSCode      sln
    duti -s com.microsoft.VSCode      csproj
    duti -s com.apple.archiveutility  aar 
    duti -s com.apple.archiveutility  nupkg 
    duti -s com.apple.archiveutility  apk 
    duti -s us.deathmarine.luyten     jar   
    duti -s us.deathmarine.luyten     aar   
}

function duti_get()
{
    # reboot needed
    sudo shutdown -r now
}
