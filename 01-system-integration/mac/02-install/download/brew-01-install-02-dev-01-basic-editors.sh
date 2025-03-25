#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB \
    --cask \
        visual-studio-code \
        visual-studio-code-insiders \


brew $ACTION_VERB \
    --cask \
        sublime-text \
        atom \
        brackets \
        bbedit \
        zed \
        zed@preview \
        fleet


brew $ACTION_VERB \
    neovim \
    fleet-cli \
