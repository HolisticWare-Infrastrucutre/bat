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


VBoxManage list vms
open \
	-a /Applications/Genymotion.app/Contents/MacOS/player.app \
		--args \
		--vm-name '97542b95-0c7a-46ea-8015-53a58eb283a2'

react-native run-android &
