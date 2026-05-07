# repo-dotnet-teplate.scpt.md

repo-dotnet-teplate.scpt.md

```
tell application "iTerm"
	--Create initial window
	create window with default profile
	
	--Create a second tab in the initial window
	tell current window
		create tab with default profile
	end tell
	
	--Send a command to the first tab
	tell current session of tab 1 of current window
		write text "echo apple"
	end tell
	
	--Send a couple of commands to the second tab
	tell current session of tab 2 of current window
		write text "echo banana"
		write text "echo clementine"
	end tell
	
	--Send another command to the first tab
	tell current session of tab 1 of current window
		write text "echo pie"
	end tell
	
	--Select the first tab
	tell tab 1 of current window
		select
	end tell
end tell
```