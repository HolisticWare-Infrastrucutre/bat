echo off

set BROWSER="%USERPROFILE%\AppData\Local\Google\Chrome SxS\Application\chrome.exe"


%BROWSER% ^
		https://myaccount.payoneer.com/MainPage/Transactions.aspx ^
		http://payoneer.com ^
		http://skrill.com ^
		http://transferwise.com ^



	
@IF %ERRORLEVEL% NEQ 0 PAUSE

:: skrill == moneybookers

