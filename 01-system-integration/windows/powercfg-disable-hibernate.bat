@echo off

powercfg.exe /hibernate off

@IF %ERRORLEVEL% NEQ 0 PAUSE	

