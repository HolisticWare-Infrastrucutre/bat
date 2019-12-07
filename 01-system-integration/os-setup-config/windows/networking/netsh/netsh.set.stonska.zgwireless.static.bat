::cd c:\windows\system32


call netsh.set.bat netconfig.stonska.zgwireless.txt
call ipconfig_restart.bat

netsh diag gui


