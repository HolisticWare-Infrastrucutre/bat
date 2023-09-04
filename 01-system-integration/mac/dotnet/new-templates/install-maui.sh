#!/bin/zsh

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

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
"\
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

dotnet new list --type project
dotnet new list --type item

dotnet new list

