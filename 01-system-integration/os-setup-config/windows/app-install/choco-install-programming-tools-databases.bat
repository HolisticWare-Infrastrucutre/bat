@echo off

set APPS=^
	sqlserver2014express ^
	mssqlserver2012express ^
	mysql ^
	mysql.workbench ^
	mysql.utilities ^
	sqlite ^
	sqlite.shell ^
	sqlite.analyzer ^
	postgress ^
	monogodb ^
	
	
::===================================================================
::choco install %APPS%
::set COMMAND=cinst -y -verbose --allowEmptyChecksums

:: chocolatey update packageName [-source ...] [-prerelease]
set COMMAND=cup -y -verbose --allowEmptyChecksums

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
