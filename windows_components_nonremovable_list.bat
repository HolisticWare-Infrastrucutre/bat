echo off

echo List of non-removable components in 
echo    Control Panel > Add Remove Programs > Windows Components
echo and during instalation in 
echo    winnt.sif [Components] section
echo Removing (renaming) them from i386\ directory 
echo and 
echo removing references from layout.inf


::set COMPONENTS=^
::             COMPONENTname1 ^
::             COMPONENTname2

set COMPONENTS=^

::=======================================================
echo Movie Maker

set COMPONENT=movemk.ch_
echo      %COMPONENT%
move /Y %COMPONENT% %COMPONENT%.removed
set COMPONENTS=%COMPONENTS% %COMPONENT%

set COMPONENT=movemk.ex_
echo      %COMPONENT%
move /Y %COMPONENT% %COMPONENT%.removed
set COMPONENTS=%COMPONENTS% %COMPONENT%

set COMPONENT=movemk.in_
echo      %COMPONENT%
move /Y %COMPONENT% %COMPONENT%.removed
set COMPONENTS=%COMPONENTS% %COMPONENT%

           
::=======================================================
echo Net Meeting

set COMPONENT=netmeet.ht_
echo      %COMPONENT%
move /Y %COMPONENT% %COMPONENT%.removed
set COMPONENTS=%COMPONENTS% %COMPONENT%

::=======================================================
echo MSN Messenger


::=======================================================
echo Outlook Express


::=======================================================
echo Media Player

MPLAY32.ex_
MPLAYER2.CN_
MPLAYER2.EX_
MPLAYER2.HL_
MPLAYER2.IN_


::=======================================================

set COMPONENT=

:: COMPONENTS must be returned to shell so do not uncomment
:: following line
:: set COMPONENTS=