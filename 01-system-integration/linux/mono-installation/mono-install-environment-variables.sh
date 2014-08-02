#!/bin/bash

PREFIX_MONO=/usr/local

# -----------------------------------------------------------------------------------
# environment variables for running mono
#
export PATH=$PREFIX_MONO/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX_MONO/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX_MONO/lib/pkgconfig:$PKG_CONFIG_PATH 
# -----------------------------------------------------------------------------------
