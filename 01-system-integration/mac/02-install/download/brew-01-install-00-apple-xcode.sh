#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


# https://github.com/XcodesOrg/xcodes
brew \
    $ACTION_VERB \
        --formula \
            xcodesorg/made/xcodes

            #   xcodes

# https://github.com/XcodesOrg/XcodesApp
brew \
    $ACTION_VERB \
        --cask \
            xcodes-app
