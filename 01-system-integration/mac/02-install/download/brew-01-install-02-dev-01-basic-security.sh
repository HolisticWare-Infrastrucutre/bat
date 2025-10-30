#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

#----------------------------------------------------------------------------------------------
#
brew \
    $ACTION_VERB \
        --cask \
            keepassxc \
            avast-security \

            