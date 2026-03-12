#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update


#----------------------------------------------------------------------------------------------
brew tap homebrew/science # adds another source for applications.
brew $ACTION_VERB \
    octave \
    R \
    julia \

#     python3 \
# python@3.13
# Install command:
# brew install python@3.13
# Also known as: python, python3, python@3


brew $ACTION_VERB \
    --cask \
    R \
    scilab \
    r \
    rstudio \

boots https://www.utc.fr/˜mottelet/scilab/download/branch-6.1/scilab-branch-6.1-x86_64.dmg

echo "alias rstudio='open -a RStudio'" >> $HOME/.bash_profile
source $HOME/.bash_profile
echo "alias rstudio='open -a RStudio'" >> $HOME/.zshrc
source $HOME/.zshrc

