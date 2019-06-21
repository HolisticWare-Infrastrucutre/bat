#!/bin/bash

# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos?view=powershell-6

export TOOLS=\
"
openssl
powershell
"

xcode-select --install
for TOOL in $TOOLS
do
    echo tool = $VC_EXTENSION
    brew cask install \
        $TOOL
    brew update
    brew cask upgrade \
        $TOOL
done
