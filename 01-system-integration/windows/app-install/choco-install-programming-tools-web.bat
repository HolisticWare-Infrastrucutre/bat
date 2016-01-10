@echo off

set APPS=^
	nodejs ^
	fiddler4 ^
	wireshark ^
	xenulinksleuth ^
	inkscape -pre ^
	newrelic.netagent ^
	silverlight5sdk ^



::choco install %APPS%
cinst -y -verbose ^
	%APPS%

:: for %%a IN (%APPS%) DO (
:: 	echo %%a
::
:: 	:: choco install %%a
:: 	cinst -y -verbose ^
:: 			%%a
:: )

@IF %ERRORLEVEL% NEQ 0 PAUSE
