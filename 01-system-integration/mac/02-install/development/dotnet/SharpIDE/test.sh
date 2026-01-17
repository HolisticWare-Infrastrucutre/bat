

# SharpIDE
# 
# https://github.com/MattParkerDev/SharpIDE
# 
# https://github.com/MattParkerDev/SharpIDE/archive/refs/heads/main.zip
# 
# https://github.com/MattParkerDev/SharpIDE/blob/main/CONTRIBUTING.md
# 
# https://github.com/godotengine/godot/releases/download/4.5.1-stable/Godot_v4.5.1-stable_mono_macos.universal.zip
# 
# https://downloads.godotengine.org/?version=4.5.1&flavor=stable&slug=macos.universal.zip&platform=macos.universal
# 
# https://github.com/godotengine/godot/releases/download/4.5.1-stable/Godot_v4.5.1-stable_macos.universal.zip
# 
# https://downloads.godotengine.org/?version=4.5.1&flavor=stable&slug=mono_macos.universal.zip&platform=macos.universal
#
# https://github.com/MattParkerDev/SharpIDE/archive/refs/heads/main.zip

md $HOME/Downloads/dotnet/SharpIDE/
curl \
    -v -L -C - \
    --output-dir $HOME/Downloads/dotnet/SharpIDE/ \
    -O https://github.com/MattParkerDev/SharpIDE/archive/refs/heads/main.zip 
    
curl \
    -v -L -C - \
    --output-dir $HOME/Downloads/dotnet/SharpIDE/ \
    -O https://github.com/godotengine/godot/releases/download/4.5.1-stable/Godot_v4.5.1-stable_mono_macos.universal.zip

curl \
    -v -L -C - \
    --output-dir $HOME/Downloads/dotnet/SharpIDE/ \
    -O https://github.com/godotengine/godot/releases/download/4.5.1-stable/Godot_v4.5.1-stable_macos.universal.zip

unzip \
    $HOME/Downloads/dotnet/SharpIDE/main.zip \
    -d $HOME/Downloads/dotnet/SharpIDE/SharpIDE-main/

dotnet run --project $HOME/Downloads/dotnet/SharpIDE/SharpIDE-main/SharpIDE-main/tools/AppHost/AppHost.csproj

# https://docs.godotengine.org/en/latest/tutorials/editor/command_line_tutorial.html

open $HOME/Downloads/dotnet/SharpIDE/Godot.app
--import



maui-multiproject
maui-multihead 