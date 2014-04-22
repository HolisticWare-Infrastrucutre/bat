@echo off

set BROWSER="%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"

%BROWSER% ^
	-new-window ^
	http://holisticware.net/ ^
	http://holisticwarez.net/ ^
	http://holisticwarez.net/Composite/top.aspx ^
	http://holisticware.net/Composite/top.aspx ^
	https://twitter.com/HolisticWare ^
	https://www.facebook.com/HolisticWare ^
	http://www.linkedin.com/company/holisticware ^
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	
