#!/bin/bash

# https://macos-defaults.com/
defaults write com.apple.screencapture "location" -string "~/Downloads" && killall SystemUIServer


# https://macos-defaults.com/finder/AppleShowAllExtensions.html
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# https://macos-defaults.com/finder/AppleShowAllFiles.html#set-to-true
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder

# https://macos-defaults.com/menubar/DateFormat.html#set-to-quot-eee-d-mmm-hh-mm-ss-quot
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MM-dd HH:mm:ss\""  \
    && \
    killall SystemUIServer
# https://github.com/herrbischoff/awesome-macos-command-line#memory-management
# https://github.com/DannyNemer/dotfiles/blob/master/macos.sh
# https://www.snip2code.com/Snippet/1138321/Bootstrap-Mac-OS-X-Configuration

# https://github.com/search?utf8=%E2%9C%93&q=dotfiles
# https://github.com/ryanb/dotfiles
# https://github.com/holman/dotfiles

brew cask install \
    mysides \


mkdir /Users/Shared/Projects
mysides add \
    Projects \
    file:///Users/Shared/Projects

mysides add \
    "Macintosh HD" \
    "file:///Volumes/Macintosh HD/"


brew cask install \
    iterm2 \

# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://eclecticlight.co/2019/08/15/global-defaults-in-macos-mojave/
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://eclecticlight.co/2019/08/15/global-defaults-in-macos-mojave/
# https://marketmix.com/de/mac-osx-umfassende-liste-der-terminal-defaults-commands/

defaults domains | tr ',' '\n'


# possible to use the shortcut:
#   CMD + SHIFT + .

defaults write  com.apple.finder AppleShowAllFiles YES

# too long paths when multiple tabs are opened
defaults write  com.apple.finder _FXShowPosixPathInTitle -bool false

# Finder

#   PathBar
defaults write  com.apple.finder ShowPathbar -bool true

#   Status Bar
defaults write  com.apple.finder ShowStatusBar -bool true

#   Set Current Folder as Default Search Scope
defaults write  com.apple.finder FXDefaultSearchScope -string "SCcf"

defaults read   com.apple.finder NewWindowTargetPath
defaults write  com.apple.finder NewWindowTargetPath -string "file:///Users/Shared/Projects/"

# Set Desktop as Default:
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# Set Documents as Default:
# defaults write com.apple.finder NewWindowTarget -string "PfDo"

# hard drives:
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# external hard drives:
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# removable media:
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# mounted servers
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

# Enable the additional information (reboot needed)
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable the additional information (defaults) with:
# sudo defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo

defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.finder QuitMenuItem -bool TRUE 

killall Finder

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

# Xcode
#   Install Command Line Tools without Xcode
xcode-select --install
#   Remove All Unavailable Simulators
xcrun simctl delete unavailable


defaults write com.apple.menuextra.battery ShowPercent -string "YES"
killall SystemUIServer

# https://www.tech-otaku.com/mac/setting-the-date-and-time-format-for-the-macos-menu-bar-clock-using-terminal/

defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm" && killall SystemUIServer
defaults write com.apple.menuextra.clock FlashDateSeparators -bool true && killall SystemUIServer
 



# https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/
# https://apple.stackexchange.com/questions/300696/toggle-hot-corners-with-a-script

defaults read com.apple.dock | grep wvous 

#    "wvous-bl-corner" = 11;
#    "wvous-bl-modifier" = 0;
#    "wvous-br-corner" = 12;
#    "wvous-br-modifier" = 0;
#    "wvous-tl-corner" = 3;
#    "wvous-tl-modifier" = 0;
#    "wvous-tr-corner" = 2;
#    "wvous-tr-modifier" = 0;

# bl, br, tl and tr refer to the bottom-left, bottom-right, top-left and top-right corners respectively.
# The values for the wvous-*-corner keys represent the actions associated with each corner
# The values for the vwous-*-modifier keys represent combinations of modifier keys which need to be pressed 
# for the hot corner to trigger as a bit mask: 
# no modifier key is 0, 
# Shift is 2^17 or 131072, 
# Control is 2^18 or 262144, 
# Option is 2^19 or 524288 and 
# Command is 2^20 or 1048576.

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos#L415

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen


# Bottom left screen corner → Launchpad
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Notification Center
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0
# Top right screen corner → Show application windows
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

killall Dock

# make the shell script quit immediately in case of error. 
#   -e means "Exit immediately if a command exits with a non-zero status".
#   -u means "Treat unset variables as an error when substituting". 
# The script will still work without it, but many people consider it a best practice to include it 
# at the top of every shell script, since it makes it more likely you will catch bugs.
set -eu

# Turn off hot-corners
for corner in tl tr br bl;
  do
    defaults write com.apple.dock "wvous-$corner-corner" -int 0
  done
killall Dock


defaults write \
      com.apple.finder \
      AppleShowAllFiles YES

defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock mru-spaces -boolean NO
killall Dock


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