@echo off

c:\bin\elevate.exe "%PROGRAMFILES%"\SysInternals\BgInfo.exe

@IF %ERRORLEVEL% NEQ 0 PAUSE