@echo off

set APPS=^
	visualstudiocommunity2013 ^
	visualstudio2013-update1 ^
	visualstudio2013-update2 ^
	visualstudio2013-update3 ^
	vs2013remotetools ^
	vs2013.vscommands ^
	visualstudio2013-installerprojects ^
	vs2013.vscommands ^


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
