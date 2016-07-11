#!/bin/bash

sudo port selfupdate
sudo port upgrade outdated
sudo port install ntfs-3g

#-------------------------------------------------------------------------
# Disable SIP
# to disable the new System Integrity Protection to install into some 
# system protected directories – this involves booting your OSX into Recovery 
# Mode with ‘command’ + ‘r’ on restart and disabling with….
#-------------------------------------------------------------------------

# csrutil disable

ls -al /sbin/mount_ntfs
sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
ln -s /System/Library/Filesystems/ntfs.fs/Contents/Resources/mount_ntfs /sbin/mount_ntfs.orig
ls -al /sbin/mount_ntfs.*
ls -al /sbin/mount_ntfs*
# sudo port uninstall ntfs-3g
