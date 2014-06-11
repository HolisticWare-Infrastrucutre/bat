echo off

set BROWSER="%USERPROFILE%\AppData\Local\Google\Chrome SxS\Application\chrome.exe"


%BROWSER% ^
		https://www.facebook.com/HolisticWare ^
		https://www.facebook.com/miljenko.cvjetko ^
		https://twitter.com/holisticware ^
		https://twitter.com/moljacsharp ^
		http://hr.linkedin.com/pub/miljenko-cvjetko/4/251/911/ ^
		http://www.linkedin.com/company/holisticware
		
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE
