#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update


#-----------------------------------------------------------------------------------------------------------------------
# clipboard

# https://www.reddit.com/r/macapps/comments/13xg34c/best_clipboard_managers_for_macos_working_on/
# https://www.reddit.com/r/macapps/comments/15i6n0y/whats_the_best_clipboard_app_for_mac/
# https://www.reddit.com/r/mac/comments/1alywep/clipboard_history/
# https://www.reddit.com/r/macapps/comments/1cle6xz/battle_of_the_clipboard_managers/
# https://www.reddit.com/r/macapps/comments/1cle6xz/battle_of_the_clipboard_managers/

# https://github.com/p0deje/Maccy

brew $ACTION_VERB \
    maccy

brew $ACTION_VERB \
    --cask \
        copyclip
    
