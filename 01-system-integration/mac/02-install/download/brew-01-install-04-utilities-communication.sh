#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


brew upgrade
brew update

#----------------------------------------------------------------------------------------------
# communications
# IM
brew $ACTION_VERB --cask \
    microsoft-teams \
    slack \
    android-messages \
    discord \
    telegram \
    signal \
    google-chat \

#    gitter \
#    google-hangouts \


brew $ACTION_VERB --cask \
    microsoft-office \
    thunderbird \


brew $ACTION_VERB --cask \
    master-pdf-editor \
    foxit-pdf-editor \
    pdf-expert \
    pdfpen \
    sejda-pdf \

