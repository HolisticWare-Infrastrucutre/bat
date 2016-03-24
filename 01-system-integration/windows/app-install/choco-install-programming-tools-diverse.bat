@echo off

set APPS=^
	sharpdevelop ^
	monodevelop ^
	
	linqpad ^
	linqpad4 ^
	linqpad4.install ^
	
	nunit ^
	stylecop ^
	ncrunch2.vs2013 ^
	xmlnotepad ^
	tinycc ^
	orwelldevcpp ^
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


::===================================================================
::choco install %APPS%
::set COMMAND=cinst

:: chocolatey update packageName [-source ...] [-prerelease]
set COMMAND=cup

::choco uninstall %APPS%
::set COMMAND=cuninst
::===================================================================

:: for %%a IN (%APPS%) DO (
:: 	echo %%a
::
:: 	:: choco install %%a
:: 	cinst -y -verbose ^
:: 			%%a
:: )

@IF %ERRORLEVEL% NEQ 0 PAUSE
