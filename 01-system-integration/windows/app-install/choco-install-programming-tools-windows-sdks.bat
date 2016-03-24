@echo off

set APPS=^
	sharpdevelop ^
	windows-sdk-7.0 ^
	windows-sdk-7.1 ^
	windows-sdk-8.0 ^
	windows-sdk-8.1 ^
	windowsphone8sdk ^
	nunit ^
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
	sqlserver2014express ^
	mssqlserver2012express ^
	sqlserver2014express ^
	microsoft-build-tools ^
	owinhost


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
