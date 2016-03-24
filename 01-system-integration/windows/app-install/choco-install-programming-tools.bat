@echo off

set APPS=^
	xamarin-studio ^
	xamarin ^
	xamarin-visualstudio ^
	visualstudiocommunity2013 ^
	visualstudio2013-update1 ^
	visualstudio2013-update2 ^
	visualstudio2013-update3 ^
	vs2013remotetools ^
	vs2013.vscommands ^
	visualstudio2013-installerprojects -pre ^
	visualstudicode ^
	visualleakdetector ^
	kaxaml ^
	snoop ^
	sniff ^
	wpfinspector ^




::for %%a IN (%APPS%) DO (
::	echo %%a
::
::::	choco install ^
::)
::


@IF %ERRORLEVEL% NEQ 0 PAUSE
