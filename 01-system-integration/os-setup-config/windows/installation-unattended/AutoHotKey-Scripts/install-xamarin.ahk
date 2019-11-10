WinActivate, Xamarin Installer 
;WinWaitActive, Xamarin Installer

Sleep 100
;ControlClick 600, 430, Xamarin Installer
;Send !c
Send, {ENTER}

WinWaitActive, Xamarin Installer
Sleep 100
Send, {ENTER}

Sleep 100
Send, {TAB}{TAB}{SPACE}{ENTER}

while winactive("Xamarin Installer")
{
	ControlSend, , !n
	Sleep, 1000
}

Sleep, 5000 
IfWinExist, Installation complete
{
	WinActivate, Installation complete
	WinWaitActive, Installation complete
	Send, !c
}

Sleep, 5000 
IfWinExist, Developer Center - Xamarin
{
	WinClose
}

Return
	
;Send, !{F4}
;!`::WinClose, A
	