#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------
# tools NTFS disks
brew $ACTION_VERB --cask \
    osxfuse \
    mounty \


brew $ACTION_VERB \
    ntfs-3g \


brew $ACTION_VERB \
    blueutil \
    brightness \
    ddcctl \




