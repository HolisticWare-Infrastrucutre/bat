@echo off

set BROWSER="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"

%BROWSER% ^
	-new-window ^
	https://www.facebook.com/holisticware ^
	https://www.facebook.com/miljenko.cvjetko ^
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	
