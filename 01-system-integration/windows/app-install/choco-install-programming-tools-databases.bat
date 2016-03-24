@echo off

set APPS=^
	sqlserver2014express ^
	mssqlserver2012express ^
	mysql ^
	mysql.workbench ^
	sqlite ^
	postgress ^
	
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
