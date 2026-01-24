#!/bin/zsh

# https://github.com/dotnet/xharness

rm -fr $HOME/bin//xharness
rm -fr $HOME/bin/.dotnet/
rm -fr $HOME/bin/.store/microsoft.dotnet.xharness.cli/

cd - > /dev/null
echo "xharness uninstalled"
