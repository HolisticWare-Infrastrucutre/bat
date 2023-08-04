#!/bin/bash

#----------------------------------------------------------------------------------------------
# fingerprint in terminal
# sudo nano /etc/pam.d/sudo
# add this at the begining
# auth       sufficient     pam_tid.so

echo "auth       sufficient     pam_tid.so" | cat - /etc/pam.d/sudo > /tmp/out && mv /tmp/out /etc/pam.d/sudo
cat /etc/pam.d/sudo 
#----------------------------------------------------------------------------------------------


mkdir /Users//Shared/Projects/

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

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

osascript -e 'tell app "System Events" to display dialog "$ACTION_VERB XCode"'
#osascript -e 'tell app "Finder" to display dialog "$ACTION_VERB Xcode"'
open -a "App Store"

sudo xcodebuild -license

open https://dotnet.microsoft.com/en-us/download

open https://visualstudio.microsoft.com/

cd ~
git clone https://github.com/moljac/bat.git




sudo softwareupdate --install-rosetta


source ./brew-01-upgrade.sh