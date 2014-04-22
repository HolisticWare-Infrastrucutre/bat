@echo off

set BROWSER="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"

%BROWSER% ^
	-new-window ^
	http://www.linkedin.com/company/holisticware ^
	hr.linkedin.com/pub/miljenko-cvjetko/4/251/911/
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	
