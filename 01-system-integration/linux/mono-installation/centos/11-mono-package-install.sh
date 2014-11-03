#!/bin/bash

# -----------------------------------------------------------------------------------
# CentOS 
#		6.5
# -----------------------------------------------------------------------------------

rpm --import "https://pgp.mit.edu/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
 
yum-config-manager \
	--add-repo http://download.mono-project.com/repo/centos/

# -----------------------------------------------------------------------------------
#	Packages
#	mono-devel 
#			should be installed to compile code.
#	mono-complete 
#			should be installed to install everything 
#			this should cover most cases of “assembly not found” errors.
# -----------------------------------------------------------------------------------
yum install mono-complete

mono --version