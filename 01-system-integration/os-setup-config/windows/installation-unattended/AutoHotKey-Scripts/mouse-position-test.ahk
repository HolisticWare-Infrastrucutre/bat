

CoordMode, Mouse, Relative	; Screen, Client
SetTimer, Check, 20
return

Check:
MouseGetPos, xx, yy
Tooltip %xx%`, %yy%
return

Esc::ExitApp