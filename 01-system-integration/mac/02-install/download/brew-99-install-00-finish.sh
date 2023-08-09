#!/bin/bash

cat << \EOF >> $HOME/.zshrc
# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"
EOF

cp $HOME/.zshrc  $HOME/.zprofile
cp $HOME/.zshrc  $HOME/.bashrc
cp $HOME/.zshrc  $HOME/.bash_profile

# run `zsh -l` to make it available for current session.
zsh -l
