#!/bin/bash

defaults read   com.apple.dock "mru-spaces"
defaults write  com.apple.dock "mru-spaces" -bool "false" \
&& \
killall Dock
defaults read   com.apple.dock "mru-spaces"





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
killall Finder
killall SystemUIServer
