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
brew $ACTION_VERB \
    --cask \
        microsoft-teams \
        discord \
        whatsapp \
        slack \
        android-messages \
        telegram \
        signal \
        google-chat \
        zulip \

# MultiChat Apps
brew $ACTION_VERB \
    --cask \
        franz \
        ferdium \

#    gitter \
#    google-hangouts \
