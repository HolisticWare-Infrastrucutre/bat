echo off

call services_list.bat
echo off

::set SERVICES=^
::             servicename1 ^
::             servicename2

call services_list.bat             

::-----------------------------------------------------------------------------------



for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
        net start %%s	
        sc start %%s 
)

set SERVICES=

echo services being stopped
echo %SERVICES%

for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
        sc start %%s

:: net stop|start %%s	
:: sc command	
:: net stop %servicename%
::
:: sc stop %servicename%
:: sc config %servicename% start= disabled  ; [space only after equals]
)

set SERVICES=
pause