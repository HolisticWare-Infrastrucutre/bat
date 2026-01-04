#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


#    microsoft-remote-desktop
brew \
    $ACTION_VERB \
        --cask \
            windows-app
