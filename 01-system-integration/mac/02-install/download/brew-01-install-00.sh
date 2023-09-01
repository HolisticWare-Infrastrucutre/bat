#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


source ./brew-00-prepare.sh

#----------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos?view=powershell-6

export TOOLS=\
"
openssl
powershell
nuget
vlc
"

xcode-select --install

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for TOOL in $TOOLS;
do
    echo tool = $VC_EXTENSION
    brew install --cask \
        $TOOL
    brew update
    brew upgrade --cask \
        $TOOL
done
#----------------------------------------------------------------------------------------------

# sudo softwareupdate --list for example will present the list of apps that are set to update. 
#
#sudo softwareupdate --$ACTION_VERB {app-name}

sudo softwareupdate --$ACTION_VERB amphetamine
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# https://github.com/mas-cli/mas
brew $ACTION_VERB -y \
    mas

mas list
mas search XCode --price
mas upgrade
#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# tools

# tools - brew completion
brew $ACTION_VERB \
    curl \
    wget \
    bash-completion \
    openssl \
    tmux \
    watchman \
    ffmpeg \
    the-unarchiver \

brew $ACTION_VERB \
    zip \
    unzip \
    fuse-zip \
    p7zip \
    rar \
    archiver \
    snzip \
    lrzip \
    archiver \
    sevenzip \



brew $ACTION_VERB --cask \
    the-unarchiver \
    winzip \
    betterzip \


# tools for development
brew $ACTION_VERB \
    tree        \
    automake    \
    autoconf    \
    dos2unix    \
    gettext	    \
    libevent    \
    libtool     \
    gradle      \
    node        \
    openssl     \
    pkg-config  \
    watchman    \
    gettext     \
    pcre        \
    swig        \

# Xamarin.Android xamarin-android repo
#   user want git from brew anyway, the apple-provided one is a fossil
brew tap \
    xamarin/xamarin-android-windeps

# git shipped with MacOSx is crappy
brew $ACTION_VERB \
    git \

git config --global \
    user.name "moljac"

#Confirm that you have set the Git username correctly:
git config --global \
    user.name

## Install GCM using Homebrew:

brew tap \
    microsoft/git

brew $ACTION_VERB --cask \
    git-credential-manager-core


brew $ACTION_VERB \
    make \
    cmake \
    libtool \
    gdk-pixbuf \
    gettext \
    coreutils \
    findutils \
    gnu-tar \
    gnu-sed \
    gawk \
    gnutls \
    gnu-indent \
    gnu-getopt \
    intltool \
    ninja \
    scons \
    wget \
    xz \
    mingw-w64 \
    mingw-zlib \
    quicktype \

brew $ACTION_VERB \
    git-lfs \

# Update global git config
sudo git lfs $ACTION_VERB

# Update system git config
sudo git lfs $ACTION_VERB --system

brew $ACTION_VERB --cask \
    github \
    gitup \
    diffmerge \
    p4v \
    menumeters \
    onyx \
    
    

brew $ACTION_VERB \
    keepasxc \

#    keepassc \
#    keepassx \
#
    

# plugins for zsh (nvm)
brew $ACTION_VERB \
    duti \



# 2 hrs
caffeinate -t 7200 &

brew $ACTION_VERB --cask \
    caffeine \
    menumeters \


brew tap fwartner/tap
brew $ACTION_VERB \
    fwartner/tap/mac-cleanup

#----------------------------------------------------------------------------------------------
brew $ACTION_VERB --cask \
    powershell \

brew update

brew cask upgrade \
    powershell \

#----------------------------------------------------------------------------------------------
brew $ACTION_VERB --cask \
    openssl \


brew link --force \
    openssl

brew $ACTION_VERB --cask \
    virtualbox \
    cheatsheet \
    onyx \
    diffmerge \

brew $ACTION_VERB --cask \
    microsoft-remote-desktop


# mind mapping and knowledge
brew $ACTION_VERB --cask \
    xmind \
    freeplane \
    freemind \
    simplemind \

brew $ACTION_VERB \
    caskformula/caskformula/inkscape
brew $ACTION_VERB --cask \
    inkscape \
    vlc \


# pdf2ascii
brew $ACTION_VERB \
    ghostscript \


#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB --cask \
    visual-studio-code \
    homebrew/cask-versions/visual-studio-code-insiders \

#----------------------------------------------------------------------------------------------
brew $ACTION_VERB --cask \
    balenaetcher \
    unetbootin \

#----------------------------------------------------------------------------------------------
# tools NTFS disks
brew $ACTION_VERB --cask \
    osxfuse \
    balenaetcher \



#----------------------------------------------------------------------------------------------
brew $ACTION_VERB --cask \
    dropbox \



#----------------------------------------------------------------------------------------------
# browsers
brew tap homebrew/cask-versions

brew $ACTION_VERB --cask \
    google-chrome \
    google-chrome-canary \
    google-chrome-beta \
    google-chrome-dev \
    microsoft-edge \
    microsoft-edge-beta \
    firefox \
    firefox-developer-edition \
    firefox-nightly \
    opera \
    opera-beta \
    opera-developer \
    chromium \
    tor-browser \
    opera \
    opera-neon \


brew $ACTION_VERB --cask \
    browserosaurus \
    charles \
    chromedriver \
    opera-mobile-emulator \

brew $ACTION_VERB --cask \
    microsoft-edge \
    microsoft-edge-dev \
    microsoft-edge-beta \
    google-chrome \
    google-chrome-canary \
    firefox \
    firefox-developer-edition \

#   conflicts
brew $ACTION_VERB --cask \
    firefox-beta \
    tor-browser-alpha \

brew $ACTION_VERB \
    tor

brew untap homebrew/cask-versions

brew $ACTION_VERB --cask \
    postman \
    postman-agent \
    postman-cli \
    postmancanary \
    protonvpn \

brew $ACTION_VERB \
    protobuf \
    bond \
    avro-tools \
    flatbuffers \
    

brew $ACTION_VERB --cask \
    dash \


#----------------------------------------------------------------------------------------------
# DevOps
# gitlab
# https://docs.gitlab.com/runner/install/osx.html 
brew $ACTION_VERB \
    gitlab-runner \ 


# act - github actions
# https://github.com/nektos/act
# curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
brew $ACTION_VERB \
    act \

brew \
    services stop \
    gitlab-runner

brew \
    services start \
    gitlab-runner

brew \
    services restart \
    gitlab-runner

#----------------------------------------------------------------------------------------------

brew $ACTION_VERB \
    djvulibre \
    djview4 \

brew $ACTION_VERB --cask \
    foxit-pdf-editor \
    kindle \
    kindle-previewer \
    epubquicklook \



#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# unoplatform
brew $ACTION_VERB \
    gtk+3 \
    gnome-icon-theme \

#----------------------------------------------------------------------------------------------
# https://blog.shvetsov.com/2014/11/homebrew-cheat-sheet-and-workflow.html

brew $ACTION_VERB --cask \
        db-browser-for-sqlite

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


#----------------------------------------------------------------------------------------------
# security
# https://github.com/sidaf/homebrew-pentest

brew $ACTION_VERB \
    aircrack-ng \

brew $ACTION_VERB --cask \
    owasp-zap \

#----------------------------------------------------------------------------------------------
# markdown bash execute
function mbe() 
{
  if [ -f "$1" ]; then
    cat $1 | # print the file
    sed -n '/```bash/,/```/p' | # get the bash code blocks
    sed 's/```bash//g' | #  remove the ```bash
    sed 's/```//g' | # remove the trailing ```
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo "${1} is not valid" ;
  fi
}


echo \
"
# markdown bash execute
function mbe() 
{
  if [ -f \"$1\" ]; then
    cat $1 | # print the file
    sed -n '/\`\`\`bash/,/\`\`\`/p' | # get the bash code blocks
    sed 's/\`\`\`bash//g' | #  remove the \`\`\`bash
    sed 's/\`\`\`//g' | # remove the trailing \`\`\`
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo \"${1} is not valid\" ;
  fi
}
" >> $HOME/.bash_profile

echo \
"
# markdown bash execute
function mbe() 
{
  if [ -f \"$1\" ]; then
    cat $1 | # print the file
    sed -n '/\`\`\`bash/,/\`\`\`/p' | # get the bash code blocks
    sed 's/\`\`\`bash//g' | #  remove the \`\`\`bash
    sed 's/\`\`\`//g' | # remove the trailing \`\`\`
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo \"${1} is not valid\" ;
  fi
}
" >> $HOME/.bashrc

echo \
"
# markdown bash execute
function mbe() 
{
  if [ -f \"$1\" ]; then
    cat $1 | # print the file
    sed -n '/\`\`\`bash/,/\`\`\`/p' | # get the bash code blocks
    sed 's/\`\`\`bash//g' | #  remove the \`\`\`bash
    sed 's/\`\`\`//g' | # remove the trailing \`\`\`
    sed '/^$/d' | # remove empty lines
    /usr/bin/env sh ; # execute the command
  else
    echo \"${1} is not valid\" ;
  fi
}
" >> $HOME/.zshrc


#----------------------------------------------------------------------------------------------

# zsh compinit: insecure directories, run compaudit for list.
for f in $(compaudit);do sudo chown $(whoami):admin $f;done;

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# go/golang
brew update \
&& \
brew $ACTION_VERB \
    golang \
    go

mkdir -p $HOME/go/{bin,src,pkg}



export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#----------------------------------------------------------------------------------------------



brew cleanup
brew doctor
