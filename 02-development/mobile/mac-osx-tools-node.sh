#!/bin/bash

if ![ hash brew 2>/dev/null ] ; 
then
	./mac-osx-tools-brew.sh
fi

brew install node

node -v

