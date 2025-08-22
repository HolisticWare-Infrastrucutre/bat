#!/bin/zsh

    echo "---------------------------------------------------------------------------------------------------------------"
    echo \
    "
    "
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet new \
        mauiapp \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI01/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI01/

    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI02/
        
    dotnet new \
        maui \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI02/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI02/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI02/


    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet new \
        maui-blazor-web \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorWeb/
 
 
 
    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/
 
    dotnet new \
        maui-blazor \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/

    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.Blazor/AppMAUI.MobileHybrid.BlazorWeb/



    rm -fr \
        $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet new \
        fluentmaui-blazor-web \
            --output \
                $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/

    dotnet build \
        --target:run \
        --framework net9.0-ios \
            $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/
 
    dotnet run \
        --framework net9.0-maccatalyst \
        --project \
             $HOME/Downloads/dotnet/samples/AppMAUI.MobileHybrid.BlazorFluentWeb/AppMAUI.MobileHybrid.BlazorFluentWeb/
