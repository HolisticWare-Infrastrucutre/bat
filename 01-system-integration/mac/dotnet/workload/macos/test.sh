#!/bin/zsh

export FOLDER=$HOME/Downloads/HolisticWare

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $FOLDER/AppMacOS/

    dotnet new \\
        uninstall \\
            Microsoft.macOS.Templates
    dotnet new \\
        install \\
            Microsoft.macOS.Templates

    dotnet new \\
        macos \\
            --output \\
                $FOLDER/AppMacOS/

    dotnet \\
        run \\
        --project \\
                $FOLDER/AppMacOS/

    "
    rm -fr \
        $FOLDER/AppMacOS/

    dotnet new \
        uninstall \
            Microsoft.macOS.Templates
    dotnet new \
        install \
            Microsoft.macOS.Templates

    dotnet new \
        macos \
            --output \
                $FOLDER/AppMacOS/

    dotnet \
        run \
        --project \
                $FOLDER/AppMacOS/
