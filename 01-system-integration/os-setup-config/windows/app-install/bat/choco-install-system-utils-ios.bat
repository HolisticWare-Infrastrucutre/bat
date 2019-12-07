@echo off

set APPS=^
	fastcopy ^
	windows-tweaker.install ^
	daemontoolslite ^
	ultraiso ^
	magicdisc ^
	isorecorder ^
	virtualclonedrive ^


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
