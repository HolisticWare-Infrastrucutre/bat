#!/bin/bash

echo $1
DIR=$1

nuget update -self

# Clear the 3.x+ cache (use either command)
dotnet nuget locals http-cache --clear
nuget locals http-cache -clear

# Clear the 2.x cache (NuGet CLI 3.5 and earlier only)
nuget locals packages-cache -clear

# Clear the global packages folder (use either command)
dotnet nuget locals global-packages --clear
nuget locals global-packages -clear

# Clear the temporary cache (use either command)
dotnet nuget locals temp --clear
nuget locals temp -clear

# Clear the plugins cache (use either command)
dotnet nuget locals plugins-cache --clear
nuget locals plugins-cache -clear

# Clear all caches (use either command)
dotnet nuget locals all --clear
nuget locals all -clear

dotnet nuget locals all --clear
dotnet nuget locals global-packages -c
dotnet nuget locals temp -c


# dotnet nuget locals all -c
dotnet nuget locals all --clear


echo "=========================================================================================="
echo "If errors are present try running:"
echo "sudo rm -fr $HOME/.nuget"
echo "sudo rm -fr $HOME/.local/share/NuGet/"
