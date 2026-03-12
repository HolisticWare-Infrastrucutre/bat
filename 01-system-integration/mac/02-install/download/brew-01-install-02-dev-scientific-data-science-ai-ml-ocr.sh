#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
# search rigrep
brew $ACTION_VERB \
    rga \

brew $ACTION_VERB \
    pandoc \
    poppler \
    ffmpeg

brew $ACTION_VERB \
    ack

brew $ACTION_VERB \
    --cask \
        devonthink \
        calibre \

#----------------------------------------------------------------------------------------------
