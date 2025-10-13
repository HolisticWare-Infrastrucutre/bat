#!/usr/bin/env powershell

(Invoke-RestMethod http://localhost:11434/api/tags).Models.Name.ForEach{ ollama pull $_ }