# repo-dotnet-teplate.scpt.md

repo-dotnet-teplate.scpt.md

```
tell application "iTerm"
	set cwd to "cd /Users/Shared/Projects/d/hw/core/gh/HolisticWare.Core.BusinessDomainModels.TemplateRepo"
	--Create initial window
	create window with default profile
	
	--Create a second tab in the initial window
	tell current window
		create tab with default profile
		create tab with default profile
		create tab with default profile
		create tab with default profile
		create tab with default profile
		create tab with default profile
		create tab with default profile
	end tell
	
	--Send a command to the tab 1
	tell current session of tab 1 of current window
		write text cwd
	end tell
	
	--Send a command to the tab 2
	tell current session of tab 2 of current window
		write text "ollama serve"
	end tell
	
	delay 3

	--Send a command to the tab 3
	tell current session of tab 3 of current window
		write text cwd
		write text "ollama launch claude --model qwen3-coder-next:q8_0"
	end tell
	
	--Send a command to the tab 4
	tell current session of tab 4 of current window
		write text cwd
		write text "ollama launch claude --model qwen3.6:35b-a3b"
	end tell
	
	--Send a command to the tab 5
	tell current session of tab 5 of current window
		write text cwd
		write text "ollama launch claude --model glm-4.7-flash:bf16"
	end tell
	
	--Send a command to the tab 6
	tell current session of tab 6 of current window
		write text cwd
		write text "ollama launch claude --model gpt-oss:120b"
	end tell
	
	--Send a command to the tab 7
	tell current session of tab 7 of current window
		write text cwd
		write text "ollama launch claude --model gemma4:31b"
	end tell
	
	--Select the first tab
	tell tab 1 of current window
		select
	end tell
end tell
```