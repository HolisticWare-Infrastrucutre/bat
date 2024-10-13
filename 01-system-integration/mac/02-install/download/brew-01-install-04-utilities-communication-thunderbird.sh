#!/bin/bash

# Action/Verb
# install / uninstall / reinstall


brew upgrade
brew update

brew uninstall \
    --cask \
        thunderbird
brew install \
    --cask \
        thunderbird
        


brew doctor