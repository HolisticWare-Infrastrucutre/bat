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


# Avalonia .NET Core App                 avalonia.app       [C#],F#  Desktop/Xaml/Avalonia/Windows/Linux/macOS                                        
# Avalonia .NET Core MVVM App            avalonia.mvvm      [C#],F#  Desktop/Xaml/Avalonia/Windows/Linux/macOS                                        
# Avalonia Cross Platform Application    avalonia.xplat     [C#],F#  Desktop/Xaml/Avalonia/Web/Mobile                                                 

export ROOT_SAMPLES=$HOME/Downloads/dotnet/samples
rm -fr $ROOT_SAMPLES/AppAvalonia/
dotnet new avalonia.app -o $ROOT_SAMPLES/AppAvalonia
cd $ROOT_SAMPLES/AppAvalonia
dotnet run
cd -

rm -fr $ROOT_SAMPLES/AppAvalonia.MVVM/
dotnet new avalonia.mvvm -o $ROOT_SAMPLES/AppAvalonia.MVVM
cd $ROOT_SAMPLES/AppAvalonia.MVVM
dotnet run
cd -

rm -fr $ROOT_SAMPLES/AppAvalonia.XPlat/
dotnet new avalonia.xplat -o $ROOT_SAMPLES/AppAvalonia.XPlat
cd $ROOT_SAMPLES/AppAvalonia.XPlat/AppAvalonia.XPlat.Android/
dotnet run
cd ../../
cd AppAvalonia.XPlat/AppAvalonia.XPlat.iOS/
dotnet run
cd ../../
cd AppAvalonia.XPlat/AppAvalonia.XPlat.Desktop/
dotnet run
cd ../../
cd AppAvalonia.XPlat/AppAvalonia.XPlat.Browser/
dotnet run
cd ../../

cd -

