
set PATH=%PATH%;C:\windows\system32\wbem\

wmic.exe nic get name, index

netsh interface show interface

pause

@IF %ERRORLEVEL% NEQ 0 PAUSE	
