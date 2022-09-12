#!/bin/bash

sudo gem install activesupport -v 4.2.6
sudo gem install cocoapods
pod

/usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

osascript -e 'tell app "System Events" to display dialog "$ACTION_VERB XCode"'
#osascript -e 'tell app "Finder" to display dialog "$ACTION_VERB Xcode"'
open -a "App Store"

sudo xcodebuild -license

# open https://visualstudio.microsoft.com/

cd ~
git clone https://github.com/moljac/bat.git


brew list
brew outdated

brew update

# Download and update ALL software packages $ACTION_VERBed:

brew upgrade
brew upgrade --cask

# To see which files would be removed as no longer needed:

brew cleanup -n

# No response if there is nothing to clear.

# To really remove all files no longer needed:

brew cleanup
brew doctor
