@echo off

set APPS=^
	aspnet5 ^
	nodejs ^
	fiddler4 ^
	wireshark ^
	xenulinksleuth ^
	inkscape -pre ^
	newrelic.netagent ^
	silverlight5sdk ^
	webstorm ^
	

::===================================================================
::choco install %APPS%
set COMMAND=chinst --yes --force --verbose --debug

:: chocolatey update packageName [-source ...] [-prerelease]
::set COMMAND=cup  --yes --force --verbose --debug

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