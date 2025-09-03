#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-holisticware.sh
source $HOME/bat/01-system-integration/mac/dotnet/new-templates/install-maui.sh

# https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new
# https://dotnetnew.azurewebsites.net/

# https://github.com/dotnet/templating/wiki
# https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new
# https://github.com/dotnet/templating/wiki
# https://github.com/dotnet/samples/tree/main/core/tutorials/cli-templates-create-item-template
# https://learn.microsoft.com/en-us/dotnet/core/tutorials/cli-templates-create-template-package

# https://auth0.com/blog/create-dotnet-project-template/
# https://damienbod.com/2022/08/15/creating-dotnet-solution-and-project-templates/
# https://betterprogramming.pub/create-a-custom-template-for-dotnet-new-9feae7ed5b55

export TEMPLATEZ=\
"
#----------------------------------------------------------------------------------------------------------------------
# Aspire
Aspire.ProjectTemplates
#----------------------------------------------------------------------------------------------------------------------
# Microsoft.TemplateEngine.Authoring.Templates
# https://learn.microsoft.com/en-us/dotnet/core/tutorials/cli-templates-create-template-package#create-a-template-package-project
Microsoft.TemplateEngine.Authoring.Templates
Microsoft.TemplateEngine.Samples
#----------------------------------------------------------------------------------------------------------------------
# Blazor - Full stack web development with C# and WebAssembly
# http://blazor.net/
Microsoft.AspNetCore.Blazor.Templates::3.0.0-*
Microsoft.FluentUI.AspNetCore.Templates
Microsoft.Fast.Templates.FluentUI
#----------------------------------------------------------------------------------------------------------------------
# DevExpress
DevExpress.Maui.ProjectTemplates
# Cake.Frosting
# https://github.com/cake-build/cake
Cake.Frosting.Template
# Prism Forms QuickStarts - Empty & QuickStart project Templates for Prism for Xamarin Forms. Requires dotnet cli 2.0 pre3+
# https://github.com/dansiegel/Prism-Templates
Prism.Forms.QuickstartTemplates
# .NET MAUI Comet App (comet)
#
Clancey.Comet.Templates.Multiplatform
#----------------------------------------------------------------------------------------------------------------------
# Avalonia
# 
Avalonia.Templates
Uno.Templates
Microsoft.Maui.Templates.net8
Microsoft.Maui.Templates.net9
Microsoft.Maui.Templates.net10
Microsoft.iOS.Templates
Microsoft.Android.Templates
Microsoft.MacCatalyst.Templates
Microsoft.macOS.Templates
Microsoft.tvOS.Templates

#----------------------------------------------------------------------------------------------------------------------
# WCF
CoreWCF.Templates
Microsoft.OData.WebApiTemplate
#----------------------------------------------------------------------------------------------------------------------
# AI
Microsoft.Extensions.AI.Templates

"


IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TEMPLATE in $TEMPLATEZ
do
    if [[ $TEMPLATE == "#"* ]]
    then
        echo "......................................................................"
        echo $TEMPLATE
        continue
    fi

    echo "Template: $TEMPLATE"
    echo "      uninstalling"
    dotnet new uninstall   \
            $TEMPLATE \
            --verbosity diagnostic

    echo "      installing"
    dotnet new install \
            $TEMPLATE \
            --verbosity diagnostic
done



echo "-----------------------------------------------------------------------------------------------------------------"
export TEMPLATEZ=\
"
Microsoft.Android.Templates
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TEMPLATE in $TEMPLATEZ
do
    if [[ $TEMPLATE == "#"* ]]
    then
        echo "......................................................................"
        echo $TEMPLATE
        continue
    fi

    echo "Template: $TEMPLATE"
    echo "      uninstalling"
    dotnet new uninstall   \
            $TEMPLATE \
            --verbosity diagnostic

    echo "      installing"
    dotnet new install \
            $TEMPLATE \
            --force \
            --verbosity diagnostic
done


echo "-----------------------------------------------------------------------------------------------------------------"
dotnet new list --type project
echo "-----------------------------------------------------------------------------------------------------------------"
dotnet new list --type item
echo "-----------------------------------------------------------------------------------------------------------------"
dotnet new list



