# finder-open-window-with-tabs-00-main.scpt

finder-open-window-with-tabs-00-main.scpt.md

```
tell application "Finder"
	activate
	set finderWindow to make new Finder window
	set toolbar visible of finderWindow to true
end tell

set paths to ¬
	{¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/AX/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/GPS-FB-MLKit/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/MAUI/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/CSharp/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/ML/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/Python/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/MatlabOctave/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/Julia/", ¬
		"/Users/Shared/Projects/d/Samples-Playgrounds/R/", ¬
		¬
			"/Users/Shared/Projects/d/Samples-Playgrounds/genetic-algorithms/"}

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