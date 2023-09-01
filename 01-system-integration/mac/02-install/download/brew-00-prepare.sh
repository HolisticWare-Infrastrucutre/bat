#!/bin/bash

open https://dotnet.microsoft.com/en-us/download

open https://visualstudio.microsoft.com/

open https://visualstudio.microsoft.com/vs/preview/#download-preview


defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES && killall Finder
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO && killall Finder
defaults write com.apple.finder NewWindowTargetPath \
        -string "file://localhost/Users//Shared/Projects/"
killall Finder







sudo gem install activesupport
sudo gem install cocoapods
pod

# /usr/bin/ruby -e \
#     "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#  Run these two commands in your terminal to add Homebrew to your PATH:
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew install --cask \
    mysides \
    iterm2 \

mkdir /Users/Shared/Projects/

mysides add \
    Projects \
    file:///Users/Shared/Projects

mysides add \
    moljac \
    file:///Users/moljac

mysides add \
    "Macintosh HD" \
    "file:///Volumes/Macintosh HD/"






osascript -e 'tell app "System Events" to display dialog "$ACTION_VERB XCode"'
#osascript -e 'tell app "Finder" to display dialog "$ACTION_VERB Xcode"'
open -a "App Store"

sudo xcodebuild -license

cd $HOME
git clone https://github.com/moljac/bat.git




sudo softwareupdate --install-rosetta


source ./brew-01-upgrade.sh