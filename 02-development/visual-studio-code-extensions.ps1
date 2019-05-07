$VSCODE_EXTENSIONS=
"
ms-vscode.csharp
ms-vscode.mono-debug
ms-vscode.powershell
ms-vsliveshare.vsliveshare
ms-vscode.azure-account
ms-azuretools.vscode-azureappservice
ms-mssql.mssql
ms-python.python
ms-vscode.Go
cake-build.cake-vscode
adrianwilczynski.asp-net-core-snippet-pack
aledev29.razor-snippets-for-asp-net-core
soltys.vscode-il
Somejack.csharp-code-snippets
rahulsahay.Csharp-ASPNETCore
schneiderpat.aspnet-helper
temilaj.asp-net-core-vs-code-extension-pack
ScottSauber.blazorsnippets
"

ForEach ($VSCODE_EXTENSION in $($VSCODE_EXTENSIONS -split "`r`n"))
{
    Write-host extension = $VSCODE_EXTENSION
    code --install-extension $VC_EXTENSION
}

code --list-extensions
