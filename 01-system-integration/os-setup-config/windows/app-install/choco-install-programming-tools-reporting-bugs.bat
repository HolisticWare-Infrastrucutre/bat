@echo off

set APPS=^
	snagit ^
	
::	greenshot ^
::	screenpresso ^

::===================================================================
::choco install %APPS%
:: set COMMAND=cinst --yes --force --verbose --debug

:: chocolatey update packageName [-source ...] [-prerelease]
::set COMMAND=cup  --yes --force --verbose --debug

::choco uninstall %APPS%
set COMMAND=cuninst --yes --force --verbose --debug
::===================================================================
	
%COMMAND% %APPS%

:: for %%a IN (%APPS%) DO (
:: 	echo %%a
::
:: 	:: choco install %%a
:: 	cinst -y -verbose ^
:: 			%%a
:: )

@IF %ERRORLEVEL% NEQ 0 PAUSE
