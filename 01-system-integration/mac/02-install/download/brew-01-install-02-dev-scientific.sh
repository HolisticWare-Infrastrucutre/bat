#!/bin/bash

#----------------------------------------------------------------------------------------------
brew tap homebrew/science # adds another source for applications.
brew $ACTION_VERB \
    octave \
    R \
    python \
    python3 \
    julia \

brew $ACTION_VERB --cask \
    R \
    homebrew/cask-versions/adoptopenjdk8 \
    scilab \
    r \
    rstudio \

boots https://www.utc.fr/˜mottelet/scilab/download/branch-6.1/scilab-branch-6.1-x86_64.dmg

echo "alias rstudio='open -a RStudio'" >> $HOME/.bash_profile
source $HOME/.bash_profile
echo "alias rstudio='open -a RStudio'" >> $HOME/.zshrc
source $HOME/.zshrc



#----------------------------------------------------------------------------------------------
brew $ACTION_VERB \
    python \
    python3 \

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

