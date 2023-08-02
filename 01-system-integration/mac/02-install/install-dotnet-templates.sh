#!/bin/zsh

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new
# https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new
# https://dotnetnew.azurewebsites.net/

export TEMPLATEZ=\
"
# template HolisticWare
HolisticWare.DotNetNew.XamarinProjectsStructureTemplate.CSharp
HolisticWare.DotNetNew.XamarinAndroidMavenBindingsProjectsStructureTemplate.CSharp

FiftyProtons.Templates.DotNetNew

# dotnet new templates
TimeWarp.Architecture
LeanArchitecture.Dotnet.Templates.Project
Clean.Architecture.Solution.Template

Avalonia.Templates
Uno.Templates
Microsoft.AspNetCore.Blazor.Templates::*-*
GtkSharp.Template.CSharp
GCC.Build.Template
NUnit3.DotNetNew.Template
Prism.Forms.QuickstartTemplates
RaspberryPi.Template
ServiceStack.Core.Templates

#------------------------------------------------------------
# CMS
cloudscribe.templates
Umbraco.Templates
#------------------------------------------------------------
# Blazor and .NET MAUI Shared UI (blazor-maui-shared)
VladislavAntonyuk.DotNetTemplates
#------------------------------------------------------------
#.NET MAUI Comet App (comet)
Clancey.Comet.Templates.Multiplatform
# Shiny GPS/BLE/
Shiny.Templates
# Prism
Prism.Templates
# Vulcan
Vulcan.Maui.Template
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