:: Disk Cleanup supports the following command-line options: 
::	/d driveletter: 
:: 		This option specifies the drive that you 
::		want Disk Cleanup to clean. 
::	/sageset: n 
::		This option displays the Disk Cleanup Settings 
::		dialog box and also creates a registry key to 
::		store the settings that you select. 
::		The n value, which is stored in the registry, 
::		allows you to specify tasks for Disk Cleanup to 
::		run. 
::		The n value can be any integer value from 0 to 
::		65535. To have all of the options available 
::		when you use the /sageset option, you might 
::		need to specify the drive where Windows is 
::		installed. 
::	/sagerun: n 
::		This option runs the specified tasks that are 
::		assigned to the n value if you use the \sageset 
::		option. 

:: ran cleanmgr /sageset:1 options set under 1

:: interactive stuff
:: cleanmgr /sageset:1
:: chkdsk d: /v /f /r /x
:: chkdsk d: /v /f /r /x
:: chkdsk e: /v /f /r /x


chkdsk c: /v 
chkdsk d: /v 
chkdsk e: /v
 

FOR /L %%i IN (1,1,10) DO (
	cleanmgr /d c /sagerun:1
	cleanmgr /d d /sagerun:1
	cleanmgr /d e /sagerun:1

	defrag c: /f -b
	defrag d: /f -b
	defrag e: /f -b
)