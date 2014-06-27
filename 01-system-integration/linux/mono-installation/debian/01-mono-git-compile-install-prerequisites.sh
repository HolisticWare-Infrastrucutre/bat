#!/bin/bash

# -----------------------------------------------------------------------------------
# Debian 
#		7.5.0
# -----------------------------------------------------------------------------------


su

# -----------------------------------------------------------------------------------
# Media change: please insert the disc labeled in the drive '/media/cdrom/' and press enter
# 
# remove the cdrom entry from the sources.list file

sed -i '/cdrom/d' /etc/apt/sources.list
# check the content of the file using:
grep -v '#' /etc/apt/sources.list

# -----------------------------------------------------------------------------------
# user new
# added during installation
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# user new as sudo-ers
chmod 600 /etc/sudoers
USER_SUDO=moljac	
echo $USER_SUDO ' ALL=(ALL) ALL' >> /etc/sudoers
chmod 400 /etc/sudoers
cat /etc/sudoers
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# sudo is not installed for minimal installations
apt-get install sudo
# -----------------------------------------------------------------------------------



# -----------------------------------------------------------------------------------
# prerequisites for building mono
sudo aptitude update && sudo aptitude full-upgrade

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

sudo apt-get install -f \
	gcc g++ automake autoconf autogen libtool make \
	bison gettext \
	bzip2 wget curl unzip git 
# -----------------------------------------------------------------------------------
	
