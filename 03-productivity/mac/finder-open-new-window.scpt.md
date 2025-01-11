# finder-open-new-window.scpt.md

finder-open-new-window.scpt.md

```
tell application "Finder"
	activate
	set finderWindow to make new Finder window
	set toolbar visible of finderWindow to true
end tell
```