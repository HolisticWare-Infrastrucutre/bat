:: The problem you are experiencing is often times caused by interference
:: during Installation by 3rd Party Software, such as your Antivirus client or
:: possibly a personal Firewall. It can also be caused by different types of
:: file corruption. This corruption can be caused with problems in the file
:: system, Antivirus "cleaning" procedures, and other various issues. The
:: solution involves performing a modified repair operation on both the .NET
:: Framework 1.1 and your Visual Studio .NET 2003. Please refer to the
:: following steps to repair your Installation:
::
:: Enable Verbose Logging
::
:: 1. Click Start>Run
:: 2. Enter “regedit” without the quotes
:: 3. Browse to HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows
:: 4. Right Click on the Installer key in the left pane and choose
:: New>String value
:: 5. Set the String>value name to Logging
:: 6. Double click logging and change the Value data to “voicewarmup”
:: without the quotes
:: 7. Close the Registry Editor
:: 8. To reverse this process at any time, delete the Logging String
:: value
::
:: Perform Diagnostic Boot:
::
:: 1. Click Start>Run
:: 2. Enter "msconfig" without the quotes (if you use GoBack, please
:: stop at this point and contact me directly)
:: 3. Select Diagnostic Startup
:: 4. Click Service tab and check the box next to Windows Installer
:: 5. Hit OK and Restart Windows
::
:: Clear Temp Directory:
::
:: 1. Click Start>Run
:: 2. Enter "%temp%" without the quotes
:: 3. Hit Control-A to select all and hit Delete to send all the files
:: to the recycle bin
::
:: Perform Repair Installation of the .NET Framework 1.1
::
:: 1. Insert your Visual Studio .NET 2003 Professional Prerequisites
:: disk
:: 2. Cancel any dialog boxes that appear (Choose Yes to run setup from
:: Disk 1)
:: 3. Click Start>Run
:: 4. Enter "x:\dotnetframework\dotnetfx.exe" /t:c:\windows\temp
:: /c:"msiexec.exe /i c:\windows\temp\netfx.msi REINSTALL=ALL
:: REINSTALLMODE=vacmus" (maintain all quotes and replace x:\dotnetframework
:: with the path to dotnetfx.exe on your Prerequisites CDROM. If necessary,
:: use Search function to find the correct path to dotnetfx.exe)

"F:\msdn\dotNetFramework\dotnetfx.exe" ^
  /t:c:\windows\temp ^
  /c:"msiexec.exe /i c:\windows\temp\netfx.msi REINSTALL=ALL REINSTALLMODE=vacmus"

::
:: Perform Repair Installation of Visual Studio .NET 2003 Professional
::
:: 1. Insert your Visual Studio .NET 2003 Professional Setup Disk 1
:: 2. Cancel any dialog boxes that appear
:: 3. Click Start>Run
:: 4. Enter "x:\vs_setup.msi" REINSTALL=ALL REINSTALLMODE=vacmus
:: (Change x: to your CDROM drive letter)

"f:\vs\vs_setup.msi" REINSTALL=ALL REINSTALLMODE=vacmus

::
:: In the Event of Failure
::
:: 1. Click Start>Run
:: 2. Enter "%temp%" without the quotes
:: 3. Select any LOG or TXT files (identifiable by Notepad icon)
:: 4. Use compression utility (WinZip, WinRAR, etc) to zip the files
:: 5. Reply to this message and attach log files for review
