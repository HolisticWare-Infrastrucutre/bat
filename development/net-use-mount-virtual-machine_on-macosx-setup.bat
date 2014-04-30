@echo off

net use p: "\\vmware-host\Shared Folders\Projects"
net use x: "\\vmware-host\Shared Folders\exFATswprjs\www.holisticware.net"

@IF %ERRORLEVEL% NEQ 0 PAUSE	
