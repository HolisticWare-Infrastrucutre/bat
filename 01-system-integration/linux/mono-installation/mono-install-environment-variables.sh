#!/bin/bash

PREFIX_MONO=/usr/local

# -----------------------------------------------------------------------------------
# environment variables for running mono
#
# several ways to add environment variables for
#		1.	mono binairies
#		2.	library search path LD_LIBRARY_PATH
#		3.	pkg-config script path PKG_CONFIG_PATH
#
# 1.	add file to  /etc/ld.so.conf.d/
# 2. 	define the variable for all users then adding script[s] in 
# 		/etc/profile.d/ should work.
# 3.	add variables in user's .bash_profile
export PATH=$PREFIX_MONO/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX_MONO/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX_MONO/lib/pkgconfig:$PKG_CONFIG_PATH 
# -----------------------------------------------------------------------------------
