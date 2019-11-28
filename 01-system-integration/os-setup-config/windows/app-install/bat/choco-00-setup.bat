@echo off

choco feature enable -n allowGlobalConfirmation

@IF %ERRORLEVEL% NEQ 0 PAUSE
