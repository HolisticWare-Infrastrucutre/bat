#!/bin/bash

# Action/Verb
# $ACTION_VERB / un$ACTION_VERB / re$ACTION_VERB
export ACTION_VERB=$ACTION_VERB

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

brew $ACTION_VERB --cask \
    devonthink \
    calibre

#----------------------------------------------------------------------------------------------
