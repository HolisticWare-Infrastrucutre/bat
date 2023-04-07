#!/usr/bin/env pwsh

# 1. Ensure the pwsh or powershell command is in PATH
# 2. Ensure the script uses Unix-style line endings (\n, not \r\n)

source $HOME/bat/01-system-integration/mac/01-uninstall-clean-remove-nuke/nuget.sh

dotnet tool list --global

# https://github.com/dotnet/sdk/issues
dotnet \
    workload \
        restore
        --verbosity

sudo \
    dotnet workload \
        install \
            maui \
            --source https://api.nuget.org/v3/index.json

sudo \
    dotnet workload \
        install \
            maui \
            --from-rollback-file https://aka.ms/dotnet/maui/rc.2.json \
            --source https://aka.ms/dotnet6/nuget/index.json \
            --source https://api.nuget.org/v3/index.json



# https://github.com/dotnet/maui/blob/main/.github/DEVELOPMENT.md


emulator -list-avds
emulator -avd pixel_2_r_11_0_-_api_30
open XCode

#export APP=AppMAUI-$(date +%FT%T)
export APP=AppMAUI-$(date +%FT%H_%M_%S)

dotnet new maui -n $APP
cd $APP
dotnet build \
    -t:Run \
    -f net6.0-maccatalyst \
    &
dotnet build \
    -t:Run \
    -f net6.0-ios \
    &
dotnet build \
    -t:Run \
    -f net6.0-android \
    &



# install local tools required to build (cake, pwsh, etc..)
dotnet tool restore
# Provision .NET 6 in bin\dotnet
dotnet build src\DotNet\DotNet.csproj
# Builds Maui MSBuild tasks
.\bin\dotnet\dotnet build Microsoft.Maui.BuildTasks.slnf
# Builds the rest of Maui
.\bin\dotnet\dotnet build Microsoft.Maui-mac.slnf
# Builds the Packages
.\bin\dotnet\dotnet build Microsoft.Maui.Packages-mac.slnf



.\bin\dotnet\dotnet `
    build `
        src\Controls\samples\Controls.Sample.Droid\Maui.Controls.Sample.Droid.csproj `
    -t:Run
.\bin\dotnet\dotnet `
    build `
        src\Controls\samples\Controls.Sample.iOS\Maui.Controls.Sample.iOS.csproj `
    -t:Run


.\bin\dotnet\dotnet `
    build `
        src\Controls\samples\Controls.Sample.SingleProject\Maui.Controls.Sample.SingleProject.csproj `
    -t:Run `
    -f net6.0-android

.\bin\dotnet\dotnet `
    build `
        src\Controls\samples\Controls.Sample.SingleProject\Maui.Controls.Sample.SingleProject.csproj `
    -t:Run -f `
    net6.0-ios




.\bin\dotnet\dotnet build src\Controls\samples\Controls.Sample.Droid\Maui.Controls.Sample.Droid.csproj -t:Run


pwsh


git pull 
dotnet nuget locals all --clear
boots https://aka.ms/dotnet/6.0.2xx/daily/dotnet-sdk-osx-x64.pkg


git clean -xdf
dotnet tool restore
dotnet build src\DotNet\DotNet.csproj
.\bin\dotnet\dotnet build Microsoft.Maui.BuildTasks.slnf
# open ./_omnisharp.sln
dotnet restore  ./_omnisharp.sln
dotnet build    ./_omnisharp.sln

.\bin\dotnet\dotnet build Microsoft.Maui-mac.slnf
.\bin\dotnet\dotnet build Microsoft.Maui-mac.slnf

.\bin\dotnet\dotnet build ./Microsoft.Maui.Packages-mac.slnf

.\bin\dotnet\dotnet `
    build `
        src\Controls\samples\Controls.Sample.SingleProject\Maui.Controls.Sample.SingleProject.csproj `
    -t:Run -f `
    net6.0-ios
