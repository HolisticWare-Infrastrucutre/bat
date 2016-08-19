#!/bin/bash

if ![ hash npm 2>/dev/null ] ; 
then
	./mac-osx-tools-node.sh
fi

brew install watchman
	
npm install -g react-native-cli


react-native init AwesomeProject
cd AwesomeProject
react-native run-ios &
react-native run-android &
