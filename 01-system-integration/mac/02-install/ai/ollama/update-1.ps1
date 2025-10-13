#!/usr/bin/env powershell


ollama list | Select-Object -Skip 1 | ForEach-Object {
    $model = ($_ -split '\s+')[0]
    if ($model -and $model -ne "NAME") {
        Write-Host "Updating model: $model"
        ollama pull $model
    }
}
