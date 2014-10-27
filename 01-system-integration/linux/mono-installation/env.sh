#!/bin/bash

# env.sh file, that would set the environment variables:

PREFIX_MONO=/usr/local

export PATH=$PREFIX_MONO/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX_MONO/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX_MONO/lib/pkgconfig:$PKG_CONFIG_PATH

# To run it
# 	'source' the env.sh:
#		. env.sh
#	or
#		source env.sh
# make sure there is a dot and a space
#
# useing only ./env.sh, this changes the environment variables in the
# subshell that is running env.sh and the change is lost when that
# subshell exits.