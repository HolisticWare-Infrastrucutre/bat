#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

#----------------------------------------------------------------------------------------------
# communications

# Chat IM
brew \
    $ACTION_VERB \
        --cask \
            inkscape \
            krita \
