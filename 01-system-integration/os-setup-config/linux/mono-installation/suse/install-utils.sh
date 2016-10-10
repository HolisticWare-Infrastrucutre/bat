#!/bin/bash

# -----------------------------------------------------------------------------------
# OpenSUSE 
#		13.1
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# Network
/sbin/ifconfig
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# SSH
systemctl status sshd.service
sudo systemctl start sshd.service

sudo zypper install openssh-server
sudo service sshd start
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# Firewall
# edit /etc/sysconfig/SuSEfirewall2
# change 
#	FW_SERVICES_EXT_TCP=""
# to	
# 	FW_SERVICES_EXT_TCP="ssh"

sed 

# to save readonly
# 	:w ! sudo tee %
# vi /etc/sysconfig/SuSEfirewall2
grep FW_SERVICES_EXT_TCP /etc/sysconfig/SuSEfirewall2
/sbin/SuSEfirewall2
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# Perequisiteis
sudo \
	zypper in \
	make autoconf automake libtool intltool gcc g++ gcc-c++ \
	git
# -----------------------------------------------------------------------------------
