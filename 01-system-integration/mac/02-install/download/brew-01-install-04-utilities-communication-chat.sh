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
brew \
    $ACTION_VERB \
        --cask \
            microsoft-teams \
            discord \
            whatsapp \
            slack \

brew \
    $ACTION_VERB \
        --cask \
            telegram \
            signal \
            google-chat \
            zulip \



#            android-messages \


# MultiChat Apps
brew \
    $ACTION_VERB \
        --cask \
            franz \
            ferdium \

#    gitter \
#    google-hangouts \
