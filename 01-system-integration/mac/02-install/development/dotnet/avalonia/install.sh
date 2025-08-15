#!/bin/bash

dotnet new uninstall \
    Avalonia.Templates
    
dotnet new install \
    Avalonia.Templates

# Avalonia .NET Core App                 avalonia.app       [C#],F#  Desktop/Xaml/Avalonia/Windows/Linux/macOS                                        
# Avalonia .NET Core MVVM App            avalonia.mvvm      [C#],F#  Desktop/Xaml/Avalonia/Windows/Linux/macOS                                        
# Avalonia Cross Platform Application    avalonia.xplat     [C#],F#  Desktop/Xaml/Avalonia/Web/Mobile                                                 



