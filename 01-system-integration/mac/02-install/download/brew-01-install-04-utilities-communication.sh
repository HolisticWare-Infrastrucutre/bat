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
    discord \
    whatsapp \
    slack \
    android-messages \
    telegram \
    signal \
    google-chat \

#    gitter \
#    google-hangouts \


brew $ACTION_VERB --cask \
    microsoft-office \
    thunderbird \
    keep \


brew $ACTION_VERB --cask \
    master-pdf-editor \
    foxit-pdf-editor \
    pdf-expert \
    pdfpen \
    sejda-pdf \

