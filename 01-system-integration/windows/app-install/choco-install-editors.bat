@echo off

APPS=^
	notepadplusplus-install ^
	notepadplusplus-withuninstall ^
	atom ^
	brackets ^
	sublimetext3 ^

	
for %%a IN (%APPS%) DO (
	echo %%a
	
::	choco install ^
)



@IF %ERRORLEVEL% NEQ 0 PAUSE	
