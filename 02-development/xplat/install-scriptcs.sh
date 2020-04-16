#!/bin/bash

# Add execute permission to the script engine executable:
sudo chmod +x ~/bin/cs-script/cscs.exe

# Create symlink to the script engine file:
sudo ln -s ~/bin/cs-script/cscs.exe ~/bin/cs-script/cscs

export PATH=~/bin/cs-script:$PATH

# The following is a few useful configuration settings for CS-Script on Linux.
sudo cscs -config:set:DefaultRefAssemblies=add:"System.ValueTuple.dll"
sudo cscs -config:set:SearchDirs=add:%MONO%/4.5/Facades

