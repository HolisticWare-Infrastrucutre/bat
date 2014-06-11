echo off

set BROWSER="%USERPROFILE%\AppData\Local\Google\Chrome SxS\Application\chrome.exe"


%BROWSER% ^
		https://www.elance.com/r/jobs/q-xamarin ^
		https://www.odesk.com/find-work-home/?topic=372622 ^
		https://www.freelancer.com/search/xamarin/ ^
		https://www.elance.com/s/moljac/ ^
		https://www.elance.com/r/contractors/q-xamarin ^
		https://www.odesk.com/o/profiles/browse/nf/?q=xamarin ^
		https://www.odesk.com/o/profiles/browse/nf/?q=miljenko ^
		http://www.guru.com/pro/search.aspx&keywords=xamarin ^

		
	
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE
