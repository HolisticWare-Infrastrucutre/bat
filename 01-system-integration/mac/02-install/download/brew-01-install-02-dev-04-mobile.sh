#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install



source ${BASH_SOURCE%/*}/brew-01-install-02-dev-mobile-android.sh
source ${BASH_SOURCE%/*}/brew-01-install-02-dev-mobile-ios.sh

#----------------------------------------------------------------------------------------------
# https://github.com/xamarin/xamarin-macios/blob/main/DOWNLOADS.md
# 
brew $ACTION_VERB \
    --cask \
        xamarin-android \
        xamarin-ios \
        xamarin-mac \

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
brew install \
    --cask \
        vysor \

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    node \
    mkcert \
    
#----------------------------------------------------------------------------------------------


