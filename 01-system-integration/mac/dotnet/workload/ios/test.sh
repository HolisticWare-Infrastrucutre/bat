#!/bin/zsh

export FOLDER=$HOME/Downloads/HolisticWare

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $FOLDER/AppiOS/

    dotnet new \\
        ios \\
            --output $FOLDER/dotnet/samples/AppiOS/

    "
    rm -fr \
        $FOLDER/dotnet/samples/AppiOS/

    dotnet new \
        ios \
            --output \
                $FOLDER/dotnet/samples/AppiOS/

    dotnet run \
        --project \
            $FOLDER/dotnet/samples/AppiOS/
