echo off

set BROWSER="%USERPROFILE%\AppData\Local\Google\Chrome SxS\Application\chrome.exe"


%BROWSER% ^
	https://www.entropay.com/ ^
	http://www.avangate.com/ ^
	https://www.paxum.com/payment/fees.php?view=views/fees.xsl ^
	http://www.clickbank.com/ ^
	http://www.neteller.com/ ^
	http://www.bluesnap.com/ecommerce/ ^
	http://www.topsimilarsites.com/similar-to/payoneer.com
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE

:: skrill == moneybookers
