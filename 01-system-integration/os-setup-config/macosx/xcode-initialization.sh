#!/bin/bash

# license

sudo xcodebuild -license


xcode-select -p
# If you see:
#
# /Applications/Xcode.app/Contents/Developer
# the full Xcode package is already installed.


# command to install Xcode Command Line Tools. It will produce a similar alert box. 
# Note the double hyphen:

xcode-select --install
