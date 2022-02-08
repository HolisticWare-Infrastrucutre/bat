#!/bin/zsh


export TOOLZ=\
"
boots
cake.tool
# Xamarin.Android
xamarin.androidbinderator.tool
xamarin.androidx.migration.tool
api-tools
dotnet-ildasm
assembly-differ
Redth.Net.Maui.Check
try-convert
dotnet-grpc
dotnet-zip
dotnet-deb
dotnet-rpm
dotnet-tarball
dotnet-outdated-tool
dotnet-xdt
dotnet-xscgen
dotnet-version-cli
dotnet-watch
dotnet-t4
dotnet-mono
dotnet-references
dotnet-delice
dotnet-script
dotnet-trace
dotnet-counters
dotnet-dump
dotnet-gcdump
Microsoft.dotnet-interactive
dotnet-retire
microsoft.tye 
wyam.tool
dotnet-project-licenses
dotnet-vs
Microsoft.dotnet-httprepl
Microsoft.dotnet-openapi
dotnet-ignore
dotnet-cleanup
dotnet-serve
dotnet-depends
dotnet-obfuscar
nukeeper
dotnet-releaser

"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TOOL in $TOOLZ
do
    if [[ $TOOL == "#"* ]]
    then
        continue
    fi

    echo Tool: $TOOL
    dotnet tool uninstall   --global  $TOOL
    dotnet tool install     --global  $TOOL     --version "*-*"
done


dotnet tool list --global