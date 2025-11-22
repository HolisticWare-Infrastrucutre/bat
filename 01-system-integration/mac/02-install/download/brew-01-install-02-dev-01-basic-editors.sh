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
            visual-studio-code \
            visual-studio-code@insiders \
            cursor \
            antigravity \
            vscodium \
            vscodium@insiders \
            windsurf \
            windsurf@next \
            kiro \
            void \

brew \
    $ACTION_VERB \
        --cask \
            cursor \


#   Windsurf now
#         vscodium \

brew $ACTION_VERB \
    --cask \
        sublime-text \
        atom \
        brackets \
        bbedit \
        zed \
        zed@preview \
        fleet \


brew $ACTION_VERB \
    neovim \
    fleet-cli \
