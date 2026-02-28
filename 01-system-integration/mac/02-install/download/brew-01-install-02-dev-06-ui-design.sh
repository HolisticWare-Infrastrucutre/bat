#!/bin/bash

source ./brew-00-prepare.sh

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew cleanup
brew upgrade
brew update

brew $ACTION_VERB \
    --cask \
        figma
