@echo off

set APPS=^
	visualstudio2015community ^
	visualstudiocommunity2013 ^
	visualstudio2013-update1 ^
	visualstudio2013-update2 ^
	visualstudio2013-update3 ^
	vs2013remotetools ^
	vs2013.vscommands ^
	visualstudio2013-installerprojects -pre ^
	vs2013.vscommands ^
	visualstudicode ^



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
