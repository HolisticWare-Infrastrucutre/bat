#!/bin/bash

if ![ hash brew 2>/dev/null ] ; 
then
	./mac-osx-tools-brew.sh
fi

if ![ hash npm 2>/dev/null ] ; 
then
	./mac-osx-tools-node.sh
fi

brew install watchman
	
npm install -g react-native-cli

react-native init AwesomeProject
cd AwesomeProject
react-native run-ios