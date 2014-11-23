#!/bin/bash

# -----------------------------------------------------------------------------------
# CentOS 
#		6.5
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
ifup eth0
# Device eth0 does not seem to be present, delaying initialisation
rm -f /etc/udev/rules.d/70-persistent-net.rules
reboot

# Remove the MACADDR entry or update it to the new MACADDR for the interface 
# (listed in this file: /etc/udev/rules.d/70-persistent-net.rules).
#
# Remove the UUID entry
vim /etc/sysconfig/networking/devices/ifcfg-eth0
# grep  /etc/sysconfig/network-scripts/ifcfg-eth0
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
sudo \
	yum -y install \
		gcc gcc-c++ automake autoconf autogen libtool make \
		bison gettext glib2 glibc-devel \
		bzip2 wget java unzip git \
		freetype fontconfig libpng libpng-devel libX11 libX11-devel glib2-devel \
		libgdi* libexif urw-fonts
# -----------------------------------------------------------------------------------

USER=someuser
useradd $USER
passwd $USER
