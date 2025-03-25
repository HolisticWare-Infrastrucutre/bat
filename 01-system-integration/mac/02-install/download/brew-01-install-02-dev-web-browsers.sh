#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
# browsers
brew tap homebrew/cask-versions

brew $ACTION_VERB --cask \
    google-chrome \
    google-chrome-canary \
    google-chrome-beta \
    google-chrome-dev \
    microsoft-edge \
    microsoft-edge-beta \
    firefox \
    firefox-developer-edition \
    firefox-nightly \
    opera \
    opera-beta \
    opera-developer \
    chromium \
    tor-browser \
    opera \
    opera-neon \

brew $ACTION_VERB \
    --force \
    --cask \
        google-chrome@beta \
        google-chrome@canary \
        google-chrome@dev


brew $ACTION_VERB --cask \
    browserosaurus \
    charles \
    chromedriver \
    opera-mobile-emulator \

brew $ACTION_VERB --cask \
    microsoft-edge \
    microsoft-edge-dev \
    microsoft-edge-beta \
    google-chrome \
    google-chrome-canary \
    firefox \
    firefox-developer-edition \
    brave-browser \
    brave-browser@dev \
    brave-browser@beta \


#   conflicts
brew $ACTION_VERB --cask \
    tor-browser-alpha \
    firefox-beta \

brew $ACTION_VERB \
    tor

brew untap homebrew/cask-versions

brew $ACTION_VERB --cask \
    postman \
    postman-agent \
    postman-cli \
    postmancanary \
    protonvpn \

brew $ACTION_VERB --cask \
    duckduckgo

# https://github.com/jarun/ddgr
# duck duck go 
brew $ACTION_VERB \
    ddgr

