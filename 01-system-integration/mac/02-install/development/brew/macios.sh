#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

Mac iOS SDK

mas search xcode | head -5
mas search xcode | head -1 | awk '{print $1}'
mas install $(mas search xcode | head -1 | awk '{print $1}')


# https://developer.apple.com/documentation/xcode/downloading-and-installing-additional-xcode-components

sudo xcode-select -r 
sudo softwareupdate --install --agree-to-license -aR
sudo xcodebuild -license
xcodebuild -runFirstLaunch 

xcodebuild -downloadPlatform iOS
xcodebuild -downloadPlatform iOS -buildVersion 18.5

brew install xcodes
brew install xcodesorg/made/xcodes || mint install XcodesOrg/xcodes

gem install xcode-install
xcversion simulators --install='iOS 18.5'


xcrun simctl list
xcodes runtimes install "iOS 18.5"


