#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppiOS/

    dotnet new \\
        ios \\
            --output $HOME/Downloads/AppiOS/

    "
    rm -fr \
        $HOME/Downloads/AppiOS/

    dotnet new \
        ios \
            --output 
                $HOME/Downloads/AppiOS/

    dotnet run \
        --project \
            $HOME/Downloads/AppiOS/
