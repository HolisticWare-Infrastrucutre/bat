#!/bin/zsh

# https://platform.uno/docs/articles/get-started-dotnet-new.html?tabs=macos

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    dotnet new \\
        uninstall \\
            Uno.Templates

    dotnet new \\
        install \\
            Uno.Templates

    dotnet new \\
        unoapp \\
            -preset=blank \\
            --output \\
                $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/

    dotnet \
        run \
        --project \
                $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/

    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMacCatalyst/

    dotnet new \
        uninstall \
            Uno.Templates

    dotnet new \
        install \
            Uno.Templates

    rm -fr \
        $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/

    dotnet new \
        unoapp \
            -preset=blank \
            --output \
                $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/AppUno.PresetBlank

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                    $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/AppUno.PresetBlank/AppUno.PresetBlank.csproj

#    dotnet \
#        run \
#            --framework:net9.0-desktop \
#                --project \
#                    $HOME/Downloads/dotnet/samples/AppUno.PresetBlank/AppUno.PresetBlank/AppUno.PresetBlank.csproj
