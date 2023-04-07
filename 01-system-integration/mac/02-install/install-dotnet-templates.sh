#!/bin/zsh

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new

export TEMPLATEZ=\
"
# template HolisticWare
HolisticWare.DotNetNew.XamarinProjectsStructureTemplate.CSharp
HolisticWare.DotNetNew.XamarinAndroidMavenBindingsProjectsStructureTemplate.CSharp

# dotnet new templates
TimeWarp.Architecture
LeanArchitecture.Dotnet.Templates.Project
Clean.Architecture.Solution.Template
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TEMPLATE in $TEMPLATEZ
do
    if [[ $TEMPLATE == "#"* ]]
    then
        continue
    fi

    echo "Template: $TEMPLATE"
    echo "      uninstalling"
    dotnet new uninstall  $TEMPLATE
    echo "      installing"
    dotnet new install    $TEMPLATE
done

dotnet new --list