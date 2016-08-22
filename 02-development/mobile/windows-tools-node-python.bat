::@echo off

choco install ^
	nodejs.install ^
	python2
	
	
@IF %ERRORLEVEL% NEQ 0 PAUSE
