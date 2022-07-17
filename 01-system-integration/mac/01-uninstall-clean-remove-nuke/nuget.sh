

dotnet nuget locals \
    http-cache \
        --list
dotnet nuget locals \
    global-packages \
        --list
dotnet nuget locals \
    temp \
        --list
dotnet nuget locals \
    all \
        --list

dotnet nuget locals \
    http-cache \
        --clear
dotnet nuget locals \
    global-packages \
        --clear
dotnet nuget locals \
    temp \
        --clear
dotnet nuget locals \
    all \
        --clear

sudo rm -fr $HOME/.nuget

dotnet nuget locals \
    http-cache \
        --list
dotnet nuget locals \
    global-packages \
        --list
dotnet nuget locals \
    temp \
        --list
dotnet nuget locals \
    all \
        --list


