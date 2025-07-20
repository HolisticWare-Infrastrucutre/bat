#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

#----------------------------------------------------------------------------------------------
# menu bar aka notch

# https://www.jessesquires.com/blog/2023/12/16/macbook-notch-and-menu-bar-fixes/
# https://github.com/dwarvesf/hidden
brew $ACTION_VERB \
    --cask \
        hiddenbar

open -a "Hidden Bar"

# https://github.com/zkondor/znotch
brew tap zkondor/dist
brew $ACTION_VERB \
    --cask \
        znotch
