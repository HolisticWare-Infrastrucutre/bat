@echo off

set BROWSER="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"

%BROWSER% ^
	-new-window ^
	https://twitter.com/holisticware ^
	https://twitter.com/moljacsharp ^
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	
