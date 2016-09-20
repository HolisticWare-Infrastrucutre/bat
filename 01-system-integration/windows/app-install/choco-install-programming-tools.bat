@echo off

set APPS=^
	xamarin-studio ^
	xamarin ^
	xamarin-visualstudio ^
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
