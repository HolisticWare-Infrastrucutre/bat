echo off

set BROWSER="%USERPROFILE%\AppData\Local\Google\Chrome SxS\Application\chrome.exe"


%BROWSER% ^
	https://github.com/moljac ^
	https://github.com/holisticware/ ^
	https://www.codeplex.com/site/users/view/moljac ^
	http://stackoverflow.com/users/1622340/moljac ^
	https://bitbucket.org/dashboard/overview ^
	
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE

