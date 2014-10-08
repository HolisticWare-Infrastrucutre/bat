@echo off

net use m: /delete
net use p: /delete
net use x: /delete
	

	
	
net use ^
	m: "\\vmware-host\Shared Folders\moljac" ^
	/persistent:yes
	
net use ^
	p: "\\vmware-host\Shared Folders\Projects" ^
	/persistent:yes
	
net use ^
	x: "\\vmware-host\Shared Folders\exFATswprjs\www.holisticware.net" ^
	/persistent:yes
	

@IF %ERRORLEVEL% NEQ 0 PAUSE	
