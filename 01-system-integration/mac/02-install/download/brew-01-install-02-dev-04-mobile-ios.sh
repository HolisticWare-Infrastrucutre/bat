#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


brew  doctor
brew  cleanup  

# Install the Command Line Tools
xcode-select --install

#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    cocoapods \

brew $ACTION_VERB \
    fastlane
# https://github.com/fastlane/snapshot
snapshot reset_simulator
#----------------------------------------------------------------------------------------------



#----------------------------------------------------------------------------------------------
# xcodes

# https://github.com/XcodesOrg/xcodes

brew install \
    xcodesorg/made/xcodes

# https://github.com/XcodesOrg/XcodesApp

brew install --cask \
    xcodes
#----------------------------------------------------------------------------------------------



 