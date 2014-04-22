:: xp
BACKUP=ntbackup

::vista
BACKUP=elevate wbadmin
::WBADMIN START BACKUP -backuptarget:\\server1\backup -include:e:

call outlook.backup.bat
:: NTBackup was removed from Vista. The new backup solution just does not give 
:: flexibility wanted. 
:: Figured what files you need from XP to run NTBackup on Vista. 
:: Turns out that you need:
:: ntbackup.exe
:: ntmsapi.dll
:: ntmsdba.dll
:: vss_ps.dll
:: vssadmin.exe
:: vssapi.dll
:: vssvc.exe

:: do get a popup when starting it still, but it all works. 
:: associate BKF files with ntbackup.exe to give them the NTBackup icon

pause
