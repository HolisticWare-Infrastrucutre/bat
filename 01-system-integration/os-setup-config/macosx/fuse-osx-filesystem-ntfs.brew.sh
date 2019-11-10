#!/bin/bash

brew install Caskroom/cask/osxfuse
brew install homebrew/fuse/ntfs-3g

#-------------------------------------------------------------------------
# Disable SIP
# to disable the new System Integrity Protection to install into some 
# system protected directories – this involves booting your OSX into Recovery 
# Mode with ‘command’ + ‘r’ on restart and disabling with….
#-------------------------------------------------------------------------

# csrutil disable

sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
ls -al /usr/local/Cellar/ntfs-3g/2016.2.22/sbin/mount_ntfs
ls -al /usr/local/Cellar/ntfs-3g

# sudo rm /sbin/mount_ntfs
sudo ln -s /usr/local/Cellar/ntfs-3g/2016.2.22/sbin/mount_ntfs /sbin/mount_ntfs


