#!/bin/bash


alias files_show='\
defaults write com.apple.finder AppleShowAllFiles YES; \
killall Finder \
/System/Library/CoreServices/Finder.app\
'

alias files_hide='\
defaults write com.apple.finder AppleShowAllFiles NO; \
killall Finder \
/System/Library/CoreServices/Finder.app\
'

defaults write com.apple.finder AppleShowAllFiles YES

killall Finder
/System/Library/CoreServices/Finder.app
