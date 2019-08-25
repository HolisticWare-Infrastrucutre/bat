
set VISUAL_STUDIO_INStALLATION_PATH="C:\Program Files (x86)\Microsoft Visual Studio 14.0\"


:: Clear %temp% folder, all temp files. Ignore files that cannot be deleted.
   
rd %TEMP%
rd %TMP%


:: reset templates. 
::	Open Windows Explorer, and navigate to  
::		<Visual Studio Installation Path>\Common7\IDE 

:: Delete the ItemTemplatesCache, ProjectTemplatesCache folder; 
rd %%\Common7\IDE\ItemTemplatesCache
rd %%\Common7\IDE\ProjectTemplatesCache

:: Open Visual Studio Command Prompt (2010) under 
::	Start menu -> All Programs 
::			-> Microsoft Visual Studio 20XX -> Visual Studio Tools 
::	run it with Administrator privilege: 
::	right-click the program -> Run as administrator); 

devenv /InstallVSTemplates
devenv /Setup

   
   


try reset Visual Studio

   Open Visual Studio Command Prompt (2010) under Start menu -> All Programs -> Microsoft Visual Studio 2010  -> Visual Studio Tools (run it with Administrator privilege: right-click the program -> Run as administrator); 
   Try some devenv switches in command prompt:
   a. Run devenv /Resetsettings to eliminate the cause of corrupted settings.
   b. Run devenv /ResetSkipPkgs in Command Prompt.
   c. Run devenv /Safemode to see if you can apply it correctly. This can eliminate the possibility that third party Add-ins or packages are causing problems.
   Switch and try a new user account. This can rule out the possibility of corrupted user profile.
   
   
   
   
   Error message “No exports were found that match the constraint contract name”
   
   
%AppData%\..\Local\Microsoft\VisualStudio\11.0\ComponentModelCache
or

%AppData%\..\Local\Microsoft\VPDExpress\11.0\ComponentModelCache
For Visual Studio 2013, change the version number:

%AppData%\..\Local\Microsoft\VisualStudio\12.0\ComponentModelCache
For Visual Studio 2015, change the version number:

%AppData%\..\Local\Microsoft\VisualStudio\14.0\ComponentModelCache

%LOCALAPPDATA%\Microsoft\VisualStudio\12.0 then rename the ComponentModelCache folder

   