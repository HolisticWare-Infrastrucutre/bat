@echo off

set APPS=^
	windows-sdk-10.1 ^
	windows-sdk-10.0 ^
	windows-sdk-8.1 ^
	windows-sdk-8.0 ^
	windows-sdk-7.1 ^
	windows-sdk-7.0 ^
	windowsphone8sdk ^
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
