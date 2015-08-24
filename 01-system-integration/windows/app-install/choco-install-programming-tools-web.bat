@echo off

set APPS=^
	inkscape -pre ^
	newrelic.netagent ^
	
	
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
