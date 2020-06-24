#!/bin/bash

# https://github.com/herrbischoff/awesome-macos-command-line#memory-management

# possible to use the shortcut:
#   CMD + SHIFT + .

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
killall Finder

# Finder

#   PathBar
defaults write com.apple.finder ShowPathbar -bool true

#   Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

#   Save to Disk by Default
#       Sets default save target to be a local disk, not iCloud.
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

#   Set Current Folder as Default Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


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






defaults domains | tr ',' '\n'


# https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/

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


# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# Top right screen corner → Show application windows
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Bottom left screen corner → Launchpad
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Notification Center
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock


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

