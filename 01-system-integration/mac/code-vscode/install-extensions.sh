#!/bin/zsh

# https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management

export EXTENSIONS=\
"
ms-azuretools.vscode-docker
ms-dotnettools.blazorwasm-companion
ms-dotnettools.csdevkit
ms-dotnettools.csharp
ms-dotnettools.dotnet-maui
ms-dotnettools.vscode-dotnet-runtime
ms-dotnettools.vscodeintellicode-csharp
ms-vscode.mono-debug
ms-vscode.powershell

aaron-bond.better-comments
adrianwilczynski.add-reference
adrianwilczynski.asp-net-core-snippet-pack
adrianwilczynski.asp-net-core-switcher
adrianwilczynski.blazor-snippet-pack
adrianwilczynski.csharp-to-typescript
adrianwilczynski.namespace
aliasadidev.nugetpackagemanagergui
AvaloniaTeam.vscode-avalonia
cake-build.cake-vscode
Codeium.codeium
corylulu.csharp-interpolated-string-converter
DavidAnson.vscode-markdownlint
DotJoshJohnson.xml
eridem.vscode-nupkg
eservice-online.vs-sharper
fabianlauer.vs-code-xml-format
Fudge.auto-using
gep13.cakerecipe-vscode
GitHub.vscode-pull-request-github
humao.rest-client
jacknq.TextTemplating
k--kato.docomment
KishoreIthadi.dotnet-core-essentials
kreativ-software.csharpextensions
lambdageek.msbuild-structured-log-viewer
leo-labs.dotnet
mikeburgh.xml-format
nromanov.dotnet-meteor
oleg-shilo.cs-script
PrateekMahendrakar.prettyxml
quicktype.quicktype
raits.csharp-extensions
redhat.vscode-xml
TabNine.tabnine-vscode
tintoy.msbuild-project-tools
unoplatform.vscode
VisualStudioExptTeam.intellicode-api-usage-examples
VisualStudioExptTeam.vscodeintellicode
wk-j.cake-runner
zbecknell.t4-support
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for EXTENSION in $EXTENSIONZ
do
    if [[ $EXTENSION == "#"* ]]
    then
        continue
    fi

    echo Extension: $EXTENSION

    code \
         --uninstall-extension \
            $EXTENSION
    code \
         --install-extension \
            $EXTENSION

done



