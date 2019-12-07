@echo off

set ELEVATE=c:\bin\elevate.exe -c
%ELEVATE% "call .\deploy-shellnew.bat"

@IF %ERRORLEVEL% NEQ 0 PAUSE
