#!/bin/bash


# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew $ACTION_VERB \
    antigen \

echo \
"
source /usr/local/share/antigen/antigen.zsh
antigen bundle lukechilds/zsh-nvm
antigen apply
" \
>> $HOME/.zshrc



brew uninstall --ignore-dependencies \
    node 
brew uninstall --force \
    node 

brew update 
brew install \
    nvm \
    node

mkdir ~/.nvm 

# configure the required environment variables. Edit the following configuration file in your home directory

vim ~/.bash_profile 

# add the below lines to ~/.bash_profile ( or ~/.zshrc for macOS Catalina or newer versions)

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.bash_profile


nvm $ACTION_VERB --lts
nvm use --lts








echo \
"
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
" >> ~/.bashrc

echo \
"
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
" >> ~/.bash_profile

echo \
"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
" >> ~/.zshrc







brew $ACTION_VERB --cask \
    docker \
    docker-machine \
    docker-toolbox \

boots https://desktop.docker.com/mac/stable/amd64/Docker.dmg

pip3 $ACTION_VERB docker-compose
open -a Docker
docker-compose

docker --version
docker-compose --version
docker-machine --version

docker ps
