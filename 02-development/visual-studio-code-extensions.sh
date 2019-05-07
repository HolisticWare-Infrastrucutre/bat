#!/bin/bash

export VSCODE_EXTENSIONS=\
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

for VC_EXTENSION in $VSCODE_EXTENSIONS
do
    echo extension = $VC_EXTENSION
    code --install-extension $VC_EXTENSION
done

export VSCODE_EXTENSIONS=\
"
aaron-bond.better-comments
austincummings.razor-plus
blairleduc.net-core-starters-pack
christian-kohler.path-intellisense
CoenraadS.bracket-pair-colorizer
craigthomas.supersharp
DavidAnson.vscode-markdownlint
dbankier.vscode-quick-select
doggy8088.netcore-snippets
DotJoshJohnson.xml
eamodio.gitlens
EditorConfig.EditorConfig
FelschR.extbundles-csharp
filipw.scriptcsRunner
formulahendry.code-runner
formulahendry.dotnet
formulahendry.dotnet-test-explorer
goessner.mdmath
GrapeCity.gc-excelviewer
Gruntfuggly.todo-tree
hbenl.vscode-test-explorer
humao.rest-client
icsharpcode.ilspy-vscode
Ikuyadeu.r
jchannon.csharpextensions
jesschadwick.nuget-reverse-package-search
jianbingfang.dupchecker
jorgeserrano.vscode-csharp-snippets
josephwoodward.vscodeilviewer
k--kato.docomment
KishoreIthadi.dotnet-core-essentials
kreativ-software.csharpextensions
leafvmaple.octave
Leopotam.csharpfixformat
markis.code-coverage
matijarmk.dotnet-core-commands
mechatroner.rainbow-csv
mohsen1.prettify-json
msjsdiag.debugger-for-chrome
nobuhito.printcode
oleg-shilo.cs-script
pdconsec.vscode-print
PeterJausovec.vscode-docker
pflannery.vscode-versionlens
PKief.material-icon-theme
quicktype.quicktype
RadwanFaci.stack-trace-formatter
redhat.java
REditorSupport.r-lsp
salbert.awesome-dotnetcore-pack
salbert.copy-text
streetsidesoftware.code-spell-checker
thiagorjes.csharpwebapi
tintoy.msbuild-project-tools
toasty-technologies.octave
VisualStudioExptTeam.vscodeintellicode
vsciot-vscode.azure-iot-edge
vsciot-vscode.azure-iot-toolkit
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vsmobile.vscode-react-native
WakaTime.vscode-wakatime
wghats.vscode-nxunit-test-adapter
wk-j.vscode-cil-complete
ybaumes.highlight-trailing-white-spaces
"

for VC_EXTENSION in $VSCODE_EXTENSIONS
do
    echo extension = $VC_EXTENSION
    code --install-extension $VC_EXTENSION
done