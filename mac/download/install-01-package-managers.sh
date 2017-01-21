#!/bin/bash

#----------------------------------------------------------------------------------------------
echo "Installing brew"
/usr/bin/ruby \
	-e \
	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
echo "Installing ports (Macports)"
open \
  https://guide.macports.org/chunked/installing.macports.html
#----------------------------------------------------------------------------------------------
