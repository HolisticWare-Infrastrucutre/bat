#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


brew upgrade
brew update


brew $ACTION_VERB \
    ebook-tools \
    epubcheck \
    
brew $ACTION_VERB \
    --cask \
        epubquicklook \
        koodo-reader \
        
