#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    dotnet new \\
        install \\
            Microsoft.MacCatalyst.Templates
    dotnet new \\
        uninstall \\
            Microsoft.MacCatalyst.Templates

    dotnet new \\
        maccatalyst \\
            --output \\
                $HOME/DownDownloads/dotnet/samplesloads/AppMacCatalyst/

    dotnet \\
        run \\
        --project \\
                $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    dotnet new \
        uninstall \
            Microsoft.MacCatalyst.Templates
    dotnet new \
        install \
            Microsoft.MacCatalyst.Templates

    dotnet new \
        maccatalyst \
            --output \
                $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    dotnet \
        run \
        --project \
                $HOME/Downloads/dotnet/samples/AppMacCatalyst/
