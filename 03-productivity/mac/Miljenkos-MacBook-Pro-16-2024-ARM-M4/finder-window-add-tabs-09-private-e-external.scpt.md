# finder-open-window-with-tabs-09-private.scpt.md

finder-open-window-with-tabs-09-private.scpt.md

```
tell application "Finder"
	activate
	set finderWindow to make new Finder window
	set toolbar visible of finderWindow to true
end tell

set paths to ¬
	{¬
		"/Users/moljac/", ¬
		"/Volumes/xFAT-1TB-2/", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/microsoft", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/microsoft-media", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/moljac-repo", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/judo/", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/02-kaznena-prijava-koraci/TODO/mails/", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/03-kaznene-prijave-protiv-mene/", ¬
		"/Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/03-kaznene-prijave-protiv-mene/04-hoo-krajac-slapp-tuzba-kleveta/", ¬
        "/Users/moljac/Downloads/"}

-- open all paths as new tabs
repeat with path in paths
	set applePath to POSIX file path
	tell application "Finder" to activate
	-- execution error: System Events got an error: osascript is not allowed to send keystrokes. (1002)
	tell application "System Events"
		keystroke "t" using command down
	end tell
	tell application "Finder"
		set target of the front Finder window to applePath
	end tell
	delay 2
end repeat
```