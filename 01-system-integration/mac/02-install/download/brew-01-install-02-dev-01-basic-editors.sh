#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB --cask \
    visual-studio-code \
    homebrew/cask-versions/visual-studio-code-insiders \

#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB --cask \
    sublime-text \
    atom \
    brackets \
    bbedit \
    zed \
    zed@preview \
