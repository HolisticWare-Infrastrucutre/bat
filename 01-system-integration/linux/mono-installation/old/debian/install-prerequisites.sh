#!/bin/bash

# -----------------------------------------------------------------------------------
# Debian 
#		7.5.0
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
vi /etc/apt/sources.list

# comment out cdrom line

# 
# deb cdrom:[Debian GNU/Linux 7.0.0 _Wheezy_ - Official amd64 CD Binary-1 20130504-14:44]/ wheezy main
# 
# deb http://ftp.us.debian.org/debian/ wheezy main
# deb-src http://ftp.us.debian.org/debian/ wheezy main
# 
# deb http://security.debian.org/ wheezy/updates main
# deb-src http://security.debian.org/ wheezy/updates main
# 
# # wheezy-updates, previously known as 'volatile'
# deb http://ftp.us.debian.org/debian/ wheezy-updates main
# deb-src http://ftp.us.debian.org/debian/ wheezy-updates main
# -----------------------------------------------------------------------------------
su


apt-get install sudo
exit

sudo apt-get update
sudo apt-get dist-upgrade

sudo \
	apt-get install \
	bison make autoconf gcc g++ gettext libmono2.0-cil \
	unzip

#	mono-gmcs make

sudo apt-get install apt-file
apt-file update
apt-file search LibXML.pm
sudo apt-get install libxml-libxml-perl
perl -MCPAN -e 'install XML::LibXML'
