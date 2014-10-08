#!/bin/bash
	
# -----------------------------------------------------------------------------------
# Ubuntu 
#		14.04
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
# network
#
# /etc/network/interfaces 

#	auto eth0
#	
#	iface eth0 inet static
#	
#	address 192.168.10.5
#	
#	netmask 255.255.255.0
#	
#	network 192.168.10.0
#	
#	broadcast 192.168.10.255
#	
#	gateway 192.168.10.1

# 	auto eth0 – enable at startup the eth0 interface
# 	iface eth0 inet static- consider that iface eth0 comes from interface eth0, 
# 	tells that the network configuration is IPv4 and static that your network interface 
# 	has static ip adresses.
# 	address – the network’s IP address
# 	netmask – the network’s mask address
# 	network – the network’s address
# 	broadcast – the broadcast address
# 	gateway – the gateway address
# -----------------------------------------------------------------------------------
# user new
USER_SUDO=someuser
useradd $USER_SUDO 
passwd $USER_SUDO
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# user new as sudo-ers
chmod 600 /etc/sudoers	
echo $USER_SUDO ' ALL=(ALL) ALL' >> /etc/sudoers
chmod 400 /etc/sudoers
cat /etc/sudoers
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# prerequisites for building mono

#	Ubuntu 14.04 only (12.04 works fine)
#	Error
#	 	MCS     [build] System.Xml.dll
#	 	System.Xml.XPath/Parser.jay(12,0): error CS1525: Unexpected symbol `using'

# configure/make command might report error stating that Perl XML:Parser is not 
# installed.
# install XML::Parser
 apt-get libexpat1-dev
# -----------------------------------------------------------------------------------
 
	