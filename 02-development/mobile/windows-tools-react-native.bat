::@echo off

npm install -g react-native-cli


react-native init AwesomeProject
cd AwesomeProject
react-native run-android

	
@IF %ERRORLEVEL% NEQ 0 PAUSE
