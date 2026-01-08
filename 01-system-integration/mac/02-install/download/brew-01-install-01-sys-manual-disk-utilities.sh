#!/bin/bash


# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew \
    $ACTION_VERB \
        --formula\
            macfuse \
            gsmartcontrol \
            smartmontools \


# linux needed
# ext4fuse

brew \
    $ACTION_VERB \
        --cask \
            balenaetcher

