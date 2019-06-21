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
defaults write com.apple.Terminal FocusFollowsMouse -string YES


# Xcode
#   Install Command Line Tools without Xcode
xcode-select --install
#   Remove All Unavailable Simulators
xcrun simctl delete unavailable






defaults domains | tr ',' '\n'

