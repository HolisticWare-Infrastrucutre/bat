@echo off

set APPS=^
	windows-sdk-10.1 ^
	windows-sdk-10.0 ^
	windows-sdk-8.1 ^
	windows-sdk-8.0 ^
	windowsphone8sdk ^


::	windows-sdk-7.1 ^
::	windows-sdk-7.0 ^
::	silverlight5sdk ^
	
::===================================================================
::choco install %APPS%
set COMMAND=choco install --yes --force --verbose --debug --allowEmptyChecksums

:: chocolatey update packageName [-source ...] [-prerelease]
::set COMMAND=cup --yes --force --verbose --debug --allowEmptyChecksums

::choco uninstall %APPS%
::set COMMAND=cuninst --yes --force --verbose --debug
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
