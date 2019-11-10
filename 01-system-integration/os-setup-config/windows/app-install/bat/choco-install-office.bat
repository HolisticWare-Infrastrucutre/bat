@echo off

set APPS=^
	libreoffice ^
	openoffice ^


::choco install %APPS%
cinst  -y -verbose --allowEmptyChecksums ^
	%APPS%

:: for %%a IN (%APPS%) DO (
:: 	echo %%a
::
:: 	:: choco install %%a
:: 	cinst -y -verbose ^
:: 			%%a
:: )

@IF %ERRORLEVEL% NEQ 0 PAUSE
