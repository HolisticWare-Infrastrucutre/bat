#!/bin/zsh

# https://peter.sh/experiments/chromium-command-line-switches/

# open in
#   new window
#   multiple urls in tabs
open -n -a \
    "Google Chrome" \
        --args \
            --new-window \
        https://github.com/dotnet/maui \
        https://github.com/dotnet/maui/issues \
        https://github.com/dotnet/maui/pulls \
        https://github.com/dotnet/maui/wiki/DeviceTests \
        https://github.com/dotnet/maui/wiki/UITests \
        https://github.com/moljac/HolisticWare.WebSite.Notes/blob/master/dotnet-netfx/dotnet/ui-user-interface/maui-multi-platform-app-ui/testing.md \
        


