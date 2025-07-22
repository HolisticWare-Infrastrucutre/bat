#!/bin/bash


# make the shell script quit immediately in case of error. 
#   -e means "Exit immediately if a command exits with a non-zero status".
#   -u means "Treat unset variables as an error when substituting". 
# The script will still work without it, but many people consider it a best practice to include it 
# at the top of every shell script, since it makes it more likely you will catch bugs.
set -eu

# https://gist.github.com/akachrislee/3220956
# https://git.herrbischoff.com/awesome-macos-command-line/about/
# https://github.com/rusty1s/dotfiles/blob/master/macos/defaults.sh
# https://www.makeuseof.com/tag/customise-mac-os-x-dock-hidden-terminal-commands/
# https://www.makeuseof.com/tag/hidden-mac-settings-defaults-command/
# https://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/
# https://ss64.com/osx/syntax-defaults.html
# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://medium.com/swlh/top-mac-os-default-behaviors-you-should-consider-changing-419b679fe290


# https://github.com/kdeldycke/dotfiles/blob/main/macos-config.sh


# https://macos-defaults.com/
defaults write com.apple.screencapture "location" -string "~/Downloads" \
&& \
killall SystemUIServer



# https://github.com/tech-otaku/macos-defaults/blob/master/date-time.sh
# https://macos-defaults.com/menubar/DateFormat.html#set-to-quot-eee-d-mmm-hh-mm-ss-quot
defaults write com.apple.menuextra.clock IsAnalog -bool false
# https://www.tech-otaku.com/mac/setting-the-date-and-time-format-for-the-macos-menu-bar-clock-using-terminal/

# defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm" && killall SystemUIServer
# defaults write com.apple.menuextra.clock FlashDateSeparators -bool true && killall SystemUIServer
defaults write com.apple.menuextra.clock "DateFormat" -string "YYYY-MM-ddTHH:mm:ss EEE"  \
&& \
killall SystemUIServer



# https://github.com/herrbischoff/awesome-macos-command-line#memory-management
# https://github.com/DannyNemer/dotfiles/blob/master/macos.sh
# https://www.snip2code.com/Snippet/1138321/Bootstrap-Mac-OS-X-Configuration

# https://github.com/search?utf8=%E2%9C%93&q=dotfiles
# https://github.com/ryanb/dotfiles
# https://github.com/holman/dotfiles



# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://eclecticlight.co/2019/08/15/global-defaults-in-macos-mojave/
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://eclecticlight.co/2019/08/15/global-defaults-in-macos-mojave/
# https://marketmix.com/de/mac-osx-umfassende-liste-der-terminal-defaults-commands/

defaults domains | tr ',' '\n'


# possible to use the shortcut:
#   CMD + SHIFT + .

source ./customize-tune/finder.sh



# Enable the additional information (reboot needed)
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable the additional information (defaults) with:
# sudo defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo

defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.finder QuitMenuItem -bool TRUE 

killall Finder
killall SystemUIServer

#   Save to Disk by Default
#       Sets default save target to be a local disk, not iCloud.
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false


#   Disable Creation of Metadata Files on Network Volumes
#       Avoids creation of .DS_Store and AppleDouble files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
#   Disable Creation of Metadata Files on USB Volumes
#       Avoids creation of .DS_Store and AppleDouble files.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


# Safari
#   Enable Develop Menu and Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true \
&& \
defaults write com.apple.Safari IncludeDevelopMenu -bool true \
&& \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true \
&& \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true \
&& \
defaults write -g WebKitDeveloperExtras -bool true






# Terminal
#   Focus Follows Mouse
defaults write \
    com.apple.Terminal \
    FocusFollowsMouse -string YES
defaults write \
    com.googlecode.iterm2 \
    FocusFollowsMouse -string YES

killall Finder
killall SystemUIServer


# Xcode
#   Install Command Line Tools without Xcode
xcode-select --install
#   Remove All Unavailable Simulators
xcrun simctl delete unavailable


defaults write com.apple.menuextra.battery ShowPercent -string "YES"
killall SystemUIServer

 
# https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/
# https://apple.stackexchange.com/questions/300696/toggle-hot-corners-with-a-script




defaults write \
      com.apple.finder \
      AppleShowAllFiles YES

defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock mru-spaces -boolean NO

killall Dock
killall Finder
killall SystemUIServer


# turn off the creation of .DS_Store files

defaults write com.apple.desktopservices DSDontWriteNetworkStores true


# boost the Magic Mouse's tracking speed beyond what the system preference allows?
#
# Apparently this is a common complaint. The way around it is to change the scaling factor. 
# The first command prints out the current scaling factor which was 3 for me, the second sets 
# the scaling to whatever value you want. You need to restart your Mac after changing this setting.

 
# output was 3 for me
defaults read -g com.apple.mouse.scaling 
defaults write -g com.apple.mouse.scaling 10


killall Dock
killall Finder
killall SystemUIServer
