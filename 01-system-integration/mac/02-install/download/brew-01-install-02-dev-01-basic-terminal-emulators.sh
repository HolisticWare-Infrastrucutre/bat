#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update


#----------------------------------------------------------------------------------------------
#
#   windsurf = codeium
brew \
    $ACTION_VERB \
        --cask \
            ghostty \
            alacritty \
            wave \
             

