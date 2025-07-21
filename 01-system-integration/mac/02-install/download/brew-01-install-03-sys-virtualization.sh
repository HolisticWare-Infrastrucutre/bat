#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

#----------------------------------------------------------------------------------------------
sudo \
    brew $ACTION_VERB \
        --cask \
            parallels \
            virtualbox \
            virtualbuddy \
            virtualbuddy@beta \
