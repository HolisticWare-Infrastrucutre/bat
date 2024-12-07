#!/bina/bash

export APPS=\
"
/System/Applications/Utilities/Activity Monitor.app
/System/Applications/Utilities/Terminal.app
/Applications/iTerm.app
/Applications/KeePassXC.app
/Applications/Company Portal.app
/Applications/Thunderbird.app
/Applications/Microsoft Outlook.app
#/Applications/Microsoft Remote Desktop.app
/Applications/Windows App.app/
/Applications/Microsoft Teams.app
/Applications/Slack.app
/Applications/Discord.app
/Applications/WhatsApp.app
/Applications/Telegram.app
#/Applications/Android Messages.app
/Applications/Visual Studio Code.app
/Applications/Visual Studio Code - Insiders.app
#/Applications/Atom.app
#/Applications/Brackets.app
/Applications/Phoenix Code.app
/Applications/GitHub Desktop.app
/Applications/Rider.app
/Applications/Android Studio.app
#/Applications/R.app
#/Applications/RStudio.app
/Applications/Docker.app
/Applications/DiffMerge.app
/Applications/Safari.app
/Applications/Microsoft Edge.app
/Applications/Microsoft Edge Beta.app
/Applications/Microsoft Edge Dev.app
/Applications/Google Chrome.app
/Applications/Google Chrome Beta.app
/Applications/Google Chrome Dev.app
/Applications/Google Chrome Canary.app
/Applications/Firefox.app
/Applications/Firefox Developer Edition.app
/Applications/Firefox Nightly.app
/Applications/Opera.app
/Applications/Opera Beta.app
#/Applications/Opera Mobile Emulator.app
/Applications/Postman Agent.app
/Applications/Postman.app
#
#/Applications/VLC.app
#/Applications/Inkscape.app
#/Applications/KeePassXC.app
#/Applications/Keep.app
#/Applications/Desktop-Google-Keep-OSX.app
#Applications/FreeMind.app
#/Applications/Freeplane.app
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split


for APP in $APPS
do
    if [[ $APP == "#"* ]]
    then
        continue
    fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo APP: $APP
    DATA='<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'$APP'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    # echo $DATA

    defaults \
        write \
            com.apple.dock persistent-apps \
            -array-add \
                "$DATA"

done

defaults \
    write \
        com.apple.dock \
            "mru-spaces" -bool "false"
            
killall Dock

defaults \
        read \
            com.apple.dock \
                persistent-apps

# Inkscape.app
# JetDriveToolbox.app
# KeePassXC.app
# Keep.app
# Keynote.app
# MacWinZipper.app
# MacZip.app
# MacZip4Win.app
# Master PDF Editor.app
# MenuMeters.app
# Microsoft Defender.app
# Microsoft Excel.app
# Microsoft OneNote.app
# Microsoft Word.app
# Numbers.app
# OneDrive.app
# OnyX.app
# Pages.app
# Parallels Desktop.app
# Parallels Toolbox.app
# PowerShell.app
# ProtonVPN.app
# Utilities
# Xmind.app
# balenaEtcher.app
# calibre.app
# dotTrace.app
# iMovie.app
# iTerm.app
# iZip.app
# macOS InstantView.app
# p4admin.app
# p4merge.app
# 
