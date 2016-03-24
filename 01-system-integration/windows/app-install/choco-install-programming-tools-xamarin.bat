@echo off

set APPS=^
	xamarin-studio ^
	xamarin ^
	xamarin-visualstudio ^


::===================================================================
::choco install %APPS%
set COMMAND=choco install --yes --force --verbose

:: chocolatey update packageName [-source ...] [-prerelease]
::set COMMAND=cup

::choco uninstall %APPS%
::set COMMAND="cuninst --yes --force --verbose"
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
