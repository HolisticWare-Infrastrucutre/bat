#!/bin/bash

dotnet tool uninstall   -g cake.tool
dotnet tool install     -g cake.tool

dotnet tool uninstall   -g xamarin.androidbinderator.tool 
dotnet tool install     -g xamarin.androidbinderator.tool 

dotnet tool uninstall   -g xamarin.androidx.migration.tool 
dotnet tool install     -g xamarin.androidx.migration.tool 
