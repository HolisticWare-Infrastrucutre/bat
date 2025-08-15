#!/bin/zsh

# https://platform.uno/docs/articles/get-started-dotnet-new.html?tabs=macos

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    rm -fr \\
        $HOME/Downloads/AppMacCatalyst/

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
                $HOME/Downloads/AppUno.PresetBlank/

    dotnet \
        run \
        --project \
                $HOME/Downloads/AppUno.PresetBlank/

    "
    rm -fr \
        $HOME/Downloads/AppMacCatalyst/

    dotnet new \
        uninstall \
            Uno.Templates

    dotnet new \
        install \
            Uno.Templates

    dotnet new \
        unoapp \
            -preset=blank \
            --output \
                $HOME/Downloads/AppUno.PresetBlank/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-android \
            $HOME/Downloads/AppUno.PresetBlank/AppUno.PresetBlank

    dotnet \
        run \
            --framework:net9.0-ios \
                --project \
                    $HOME/Downloads/AppUno.PresetBlank/AppUno.PresetBlank/AppUno.PresetBlank.csproj


    dotnet \
        run \
            --framework:net9.0-desktop \
                --project \
                    $HOME/Downloads/AppUno.PresetBlank/AppUno.PresetBlank/AppUno.PresetBlank.csproj
