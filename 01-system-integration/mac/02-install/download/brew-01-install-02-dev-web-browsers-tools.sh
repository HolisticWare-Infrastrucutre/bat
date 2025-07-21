#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

#----------------------------------------------------------------------------------------------
# browsers

brew $ACTION_VERB \
    --cask \
        browserosaurus \
        charles \
        chromedriver \
        opera-mobile-emulator \

brew $ACTION_VERB \
    --cask \
        postman \
        postman-agent \
        postman-cli \
        postmancanary \
        protonvpn \

brew $ACTION_VERB \
    --formula \
    tor

# https://github.com/jarun/ddgr
# duck duck go 
brew $ACTION_VERB \
    --formula \
    ddgr

brew untap homebrew/cask-versions



