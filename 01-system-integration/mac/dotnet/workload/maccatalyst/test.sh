#!/bin/zsh

export FOLDER=$HOME/Downloads/HolisticWare

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $FOLDER/dotnet/samples/AppMacCatalyst/

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
                $FOLDER/dotnet/samples/AppMacCatalyst/

    "
    rm -fr \
        $FOLDER/dotnet/samples/AppMacCatalyst/

    dotnet new \
        uninstall \
            Microsoft.MacCatalyst.Templates
    dotnet new \
        install \
            Microsoft.MacCatalyst.Templates

    dotnet new \
        maccatalyst \
            --output \
                $FOLDER/dotnet/samples/AppMacCatalyst/

    dotnet \
        run \
        --project \
                $FOLDER/dotnet/samples/AppMacCatalyst/
