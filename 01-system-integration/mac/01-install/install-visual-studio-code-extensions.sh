#!/bin/bash

export EXTENSIONS=\
"
# dotnet C#
ban.spellright 
Clancey.comet-debug
colinfang.markdown-julia
DavidAnson.vscode-markdownlint
docsmsft.docs-yaml
Gimly81.matlab
googlecloudtools.cloudcode
haberdashPI.matlab-in-julia
haberdashPI.python-in-julia
haberdashPI.R-in-julia
hediet.debug-visualizer
julialang.language-julia
julialang.language-julia-insider
mechatroner.rainbow-csv
mindaro-dev.file-downloader
mindaro.mindaro
ms-azuretools.vscode-docker
ms-dotnettools.csharp
ms-kubernetes-tools.vscode-aks-tools
ms-kubernetes-tools.vscode-kubernetes-tools
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-vscode-remote.remote-containers
ms-vscode.azure-account
ms-vscode.cpptools
ms-vscode.powershell
ms-vsonline.vsonline
oliversturm.fix-json
owenfarrell.vscode-microtask
qub.qub-msbuild
quicktype.quicktype
# YAML
redhat.vscode-commons
redhat.vscode-yaml
singularitti.vscode-julia-formatter
streetsidesoftware.code-spell-checker
sterin.msbuild-tools
tintoy.msbuild-project-tools
VisualStudioExptTeam.vscodeintellicode
"


IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for EXT in $EXTENSIONS
do

    if [[ $EXT == "#"* ]]
    then
        continue
    fi

    echo VS Code extension:     $EXT
    code --install-extension $EXT
done
