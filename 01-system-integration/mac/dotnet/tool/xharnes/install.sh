#!/bin/zsh


cd $HOME/bin/
curl -L https://aka.ms/get-xharness | bash -

cd - > /dev/null
echo "xharness installed"
xharness help
