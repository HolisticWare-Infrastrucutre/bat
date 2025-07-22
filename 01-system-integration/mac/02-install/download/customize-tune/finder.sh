#!/bin/bash


# https://macos-defaults.com/finder/AppleShowAllExtensions.html
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" \
&& \
killall Finder

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAppSleepDisabled -bool YES


# https://macos-defaults.com/finder/AppleShowAllFiles.html#set-to-true
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" \
&& \
killall Finder




defaults read   com.apple.finder AppleShowAllFiles
defaults write  com.apple.finder AppleShowAllFiles YES
defaults read   com.apple.finder AppleShowAllFiles


# too long paths when multiple tabs are opened
defaults read   com.apple.finder _FXShowPosixPathInTitle
defaults write  com.apple.finder _FXShowPosixPathInTitle -bool false
defaults read   com.apple.finder _FXShowPosixPathInTitle

# Finder

#   PathBar
defaults read   com.apple.finder ShowPathbar
defaults write  com.apple.finder ShowPathbar -bool true \
&& \
killall Finder
defaults read   com.apple.finder ShowPathbar


#   Status Bar
defaults read   com.apple.finder ShowStatusBar
defaults write  com.apple.finder ShowStatusBar -bool true \
&& \
killall Finder
defaults read   com.apple.finder ShowStatusBar

#   Set Current Folder as Default Search Scope
defaults read   com.apple.finder "FXDefaultSearchScope"
defaults write  com.apple.finder "FXDefaultSearchScope" -string "SCcf" \
&& \
killall Finder
defaults read   com.apple.finder "FXDefaultSearchScope"


defaults read   com.apple.finder "NewWindowTargetPath"
defaults write  com.apple.finder "NewWindowTargetPath" -string "file://Users/Shared/Projects/" \
&& \
killall Finder
defaults read   com.apple.finder "NewWindowTargetPath"

# Set Desktop as Default:
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# Set Documents as Default:
# defaults write com.apple.finder NewWindowTarget -string "PfDo"

# Set the desktop as the default location for new finder windows
## For other paths, use 'PfLo' and 'file:///full/path/here/'
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"


# hard drives:
defaults read   com.apple.finder "ShowHardDrivesOnDesktop"
defaults write  com.apple.finder "ShowHardDrivesOnDesktop" -bool true \
&& \
killall Finder
defaults read   com.apple.finder "ShowHardDrivesOnDesktop"

# external hard drives:
defaults read   com.apple.finder "ShowExternalHardDrivesOnDesktop"
defaults write  com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool true \
&& \
killall Finder

# removable media:
defaults read   com.apple.finder "ShowRemovableMediaOnDesktop"
defaults write  com.apple.finder "ShowRemovableMediaOnDesktop" -bool true \
&& \
killall Finder

# mounted servers
defaults read   com.apple.finder "ShowMountedServersOnDesktop"
defaults write  com.apple.finder "ShowMountedServersOnDesktop" -bool true \
&& \
killall Finder

