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
        google-chrome \
        google-chrome@canary \
        google-chrome@beta \
        google-chrome@dev \
        microsoft-edge \
        microsoft-edge@beta \
        microsoft-edge@dev \
        firefox \
        firefox@developer-edition \
        firefox@nightly \
        opera \
        opera@beta \
        opera-developer \
        chromium \
        tor-browser \
        opera \
        opera-neon \
        brave-browser \
        brave-browser@beta \
        tor-browser \
        duckduckgo \

#       tor-browser@alpha \
#       brave-browser@dev \

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



