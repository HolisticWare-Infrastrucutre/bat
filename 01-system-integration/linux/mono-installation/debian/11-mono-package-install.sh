#!/bin/bash

# -----------------------------------------------------------------------------------
# Debian 
#		7.5.0
# -----------------------------------------------------------------------------------

wget http://download.mono-project.com/repo/xamarin.gpg
sudo apt-key add xamarin.gpg

echo \
	"deb http://download.mono-project.com/repo/debian wheezy main" \
	| 
	\
	sudo tee --append /etc/apt/sources.list.d/mono-xamarin.list

sudo apt-get update

# -----------------------------------------------------------------------------------
#	Packages
#	mono-devel 
#			should be installed to compile code.
#	mono-complete 
#			should be installed to install everything 
#			this should cover most cases of “assembly not found” errors.
# -----------------------------------------------------------------------------------

sudo apt-get install mono-complete
 
