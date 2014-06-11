echo off

VER | findstr /i "5.0." > nul
IF %ERRORLEVEL% EQU 0 set version=2000

VER | findstr /i "5.1." > nul
IF %ERRORLEVEL% EQU 0 set version=XP

VER | findstr /i "5.2." > nul
IF %ERRORLEVEL% EQU 0 set version=2003

VER | findstr /i "6.0." > nul
IF %ERRORLEVEL% EQU 0 set version=Vista

echo %version%

pause