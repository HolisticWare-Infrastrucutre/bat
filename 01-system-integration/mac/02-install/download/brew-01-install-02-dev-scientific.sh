#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
brew tap homebrew/science # adds another source for applications.
brew $ACTION_VERB \
    octave \
    R \
    python \
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



#----------------------------------------------------------------------------------------------

python --version
python3 --version
which pip
which pip3

sudo pip3 $ACTION_VERB --upgrade pip


# python packages: Scientific computing:
pip3 $ACTION_VERB numpy
pip3 $ACTION_VERB scipy
pip3 $ACTION_VERB sympy
python -c 'import numpy ; numpy.test();'
python -c 'import scipy ; scipy.test();'

# python packages: Data management:
pip3 $ACTION_VERB pandas


# python packages: plotting
pip3 $ACTION_VERB matplotlib
#brew $ACTION_VERB \
#    homebrew/python/matplotlib \
#    --with-cairo \
#    --with-tex

pip3 $ACTION_VERB --upgrade pip
pip3 $ACTION_VERB jupyter

pip $ACTION_VERB jupyterlab
pip $ACTION_VERB notebook
pip $ACTION_VERB voila

jupyter-lab &
jupyter notebook &
voila &

