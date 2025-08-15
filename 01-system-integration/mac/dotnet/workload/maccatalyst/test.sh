#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppMacCatalyst/

    dotnet new \\
        install \\
            Microsoft.MacCatalyst.Templates
    dotnet new \\
        uninstall \\
            Microsoft.MacCatalyst.Templates

    dotnet new \\
        maccatalyst \\
            --output \\
                $HOME/Downloads/AppMacCatalyst/

    dotnet \\
        run \\
        --project \\
                $HOME/Downloads/AppMacCatalyst/

    "
    rm -fr \
        $HOME/Downloads/AppMacCatalyst/

    dotnet new \
        uninstall \
            Microsoft.MacCatalyst.Templates
    dotnet new \
        install \
            Microsoft.MacCatalyst.Templates

    dotnet new \
        maccatalyst \
            --output \
                $HOME/Downloads/AppMacCatalyst/

    dotnet \
        run \
        --project \
                $HOME/Downloads/AppMacCatalyst/
