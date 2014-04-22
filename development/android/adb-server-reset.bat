@echo off


set ADB=.\adb.exe

%ADB% start-server
%ADB% kill-server
%ADB% devices

pause