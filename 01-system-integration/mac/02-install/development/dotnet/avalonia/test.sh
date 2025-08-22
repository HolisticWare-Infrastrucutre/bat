#!/bin/zsh

# https://github.com/AvaloniaUI/avalonia-dotnet-templates


    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia/

    dotnet new \
        uninstall \
            Avalonia.Templates

    dotnet new \
        install \
            Avalonia.Templates



    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia.Simple/

    dotnet new \
        avalonia.app \
            --framework net9.0 \
            --output \
                $HOME/Downloads/dotnet/samples/AppAvalonia.Simple/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppAvalonia.Simple/

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                $HOME/Downloads/dotnet/samples/AppAvalonia.Simple/


    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.CommunityToolkit/

    dotnet new \
        avalonia.mvvm \
            --mvvm CommunityToolkit \
            --framework net9.0 \
            --output \
                $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.CommunityToolkit/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.CommunityToolkit/

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.CommunityToolkit/


    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.ReactiveUI/

    dotnet new \
        avalonia.mvvm \
            --mvvm ReactiveUI \
            --framework net9.0 \
            --output \
                $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.ReactiveUI/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.ReactiveUI/

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                $HOME/Downloads/dotnet/samples/AppAvalonia.MVVM.ReactiveUI/



    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.CommunityToolkit/

    dotnet new \
        avalonia.xplat \
            --mvvm CommunityToolkit \
            --framework net9.0 \
            --output \
                $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.CommunityToolkit/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.CommunityToolkit/

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.CommunityToolkit/


    rm -fr \
        $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.ReactiveUI/

    dotnet new \
        avalonia.xplat \
            --mvvm ReactiveUI \
            --framework net9.0 \
            --output \
                $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.ReactiveUI/

    dotnet \
        build \
        --target:run \
        --framework:net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.ReactiveUI/

    dotnet \
        run \
            --framework:net9.0-maccatalyst \
                --project \
                $HOME/Downloads/dotnet/samples/AppAvalonia.XPlat.MVVM.ReactiveUI/
