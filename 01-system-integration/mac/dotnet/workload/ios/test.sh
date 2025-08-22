#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppiOS/

    dotnet new \\
        ios \\
            --output $HOME/Downloads/dotnet/samples/AppiOS/

    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppiOS/

    dotnet new \
        ios \
            --output \
                $HOME/Downloads/dotnet/samples/AppiOS/

    dotnet run \
        --project \
            $HOME/Downloads/dotnet/samples/AppiOS/
