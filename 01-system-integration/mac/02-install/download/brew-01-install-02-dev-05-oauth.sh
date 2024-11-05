#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew  doctor
brew  cleanup  

#---------------------------------------------------------------------------------------------------
# OKTA
# https://cli.okta.com/

brew install \
    --cask \
        oktadeveloper/tap/okta

brew reinstall \
    okta
