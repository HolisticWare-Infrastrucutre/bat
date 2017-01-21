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
URL=https://github.com/macports/macports-base/releases/download/v2.3.5/MacPorts-2.3.5-10.12-Sierra.pkg
curl -v -L -C - -O $URL
#----------------------------------------------------------------------------------------------

