echo off

call services_list.bat

echo services being stopped
echo %SERVICES%
echo off

::set SERVICES=^
::             servicename1 ^
::             servicename2

call services_list.bat             

echo off

call services_list.bat

echo services being stopped
echo %SERVICES%

for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
        sc stop %%s

:: net stop|start %%s	
:: sc command	
:: net stop %servicename%
::
:: sc stop %servicename%
:: sc config %servicename% start= disabled  ; [space only after equals]
)

set SERVICES=
pause
::-----------------------------------------------------------------------------------
cho off

::set SERVICES=^
::             servicename1 ^
::             servicename2

call services_list.bat             

::-----------------------------------------------------------------------------------



for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
        net stop %%s	
        sc stop %%s 
)

set SERVICES=



for %%s IN (%SERVICES%) DO (
        echo ---------------------------------------------------------
	echo %%s
        sc query displayname %%s
        sc config %%S start= disabled 
)

set SERVICES=

for %%s IN (%SERVICES%) DO (
	echo %%s
        sc query displayname %%s
        sc stop %%s
        sc config %%s start= disabled 

:: net stop|start %%s	
:: sc command	
:: net stop %servicename%
::
:: sc stop %servicename%
:: sc config %servicename% start= disabled  ; [space only after equals]
)

set SERVICES=
pause
