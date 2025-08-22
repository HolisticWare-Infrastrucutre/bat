#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppMacOS/

    dotnet new \\
        uninstall \\
            Microsoft.macOS.Templates
    dotnet new \\
        install \\
            Microsoft.macOS.Templates

    dotnet new \\
        macos \\
            --output \\
                $HOME/Downloads/AppMacOS/

    dotnet \\
        run \\
        --project \\
                $HOME/Downloads/AppMacOS/

    "
    rm -fr \
        $HOME/Downloads/AppMacOS/

    dotnet new \
        uninstall \
            Microsoft.macOS.Templates
    dotnet new \
        install \
            Microsoft.macOS.Templates

    dotnet new \
        macos \
            --output \
                $HOME/Downloads/AppMacOS/

    dotnet \
        run \
        --project \
                $HOME/Downloads/AppMacOS/
