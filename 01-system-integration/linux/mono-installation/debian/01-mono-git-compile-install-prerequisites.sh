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
	
# perl ./make-opcodes-def.pl ./cil-opcodes.xml opcode.def.tmp
# Can't locate XML/Parser.pm in @INC (@INC contains: 
#	/etc/perl /usr/local/lib/perl/5.14.2 /usr/local/share/perl/5.14.2 
#	/usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.14 /usr/share/perl/5.14 
#	/usr/local/lib/site_perl .) at ./make-opcodes-def.pl line 16.
# BEGIN failed--compilation aborted at ./make-opcodes-def.pl line 16.

sudo apt-get install -f \
	libexpat1 libexpat1-dev

# just to be suer
perl -MCPAN -e "install XML::Parser"
# perl -MCPAN -e shell 
# type" install XML::Parser
# -----------------------------------------------------------------------------------
