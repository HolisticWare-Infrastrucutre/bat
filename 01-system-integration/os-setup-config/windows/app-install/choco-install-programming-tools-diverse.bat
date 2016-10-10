@echo off

set APPS=^
	sharpdevelop ^
	stylecop ^
	ncrunch2.vs2013 ^
	xmlnotepad ^
	tinycc ^
	orwelldevcpp ^
	linqpad4 ^
	cs-script ^
	cshell ^
	ilspy ^
	dotpeek ^
	nunit ^
	swig ^
	bugshooting ^
	microsoft-build-tools ^
	owinhost ^

	
	
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
	