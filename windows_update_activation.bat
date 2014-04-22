cd /d %SystemRoot%\system32 

net.exe stop wuauserv 

regsvr32.exe wuapi.dll /s
regsvr32.exe wups.dll /s
regsvr32.exe wuaueng.dll /s 
regsvr32.exe wucltui.dll /s
regsvr32.exe MSXML3.dll /s

net.exe start wuauserv 


