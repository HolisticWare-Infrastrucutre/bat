#!/bin/bash

source ./brew-00-prepare.sh

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install





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
    keepassc \
    keepassx \

    

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


#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB \
    gradle \
    ant	\
    jabba \
    jenv \
    cfr-decompiler \
    jadx \
    procyon-decompiler \
    smali \
    dex2jar \
    flatbuffers \


# https://stackoverflow.com/questions/52524112/how-do-i-$ACTION_VERB-java-on-mac-osx-allowing-version-switching

# https://github.com/Homebrew/homebrew-cask/blob/master/Casks/adoptopenjdk.rb
# https://github.com/AdoptOpenJDK/homebrew-openjdk/tree/master/Casks
# https://github.com/AdoptOpenJDK/homebrew-openjdk/blob/master/Casks/adoptopenjdk8.rb
# https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk11-osx-x64/818.2#files
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk8-osx-x64/1644.3#files
# https://bintray.com/jetbrains/intellij-jbr
# https://bintray.com/jetbrains/intellij-jdk/
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk8-osx-x64/1644.3#files

brew tap adoptopenjdk/openjdk
brew $ACTION_VERB --cask \
    adoptopenjdk8

# https://github.com/Homebrew/homebrew-cask-versions/tree/master/Casks
brew tap homebrew/cask-versions

# https://docs.brew.sh/Taps#formula-with-duplicate-names
brew $ACTION_VERB --cask \
    java \


brew $ACTION_VERB --cask \
    homebrew/cask-versions/zulu8 \
    adoptopenjdk/openjdk/adoptopenjdk8 \
    homebrew/cask-versions/corretto8 \

brew $ACTION_VERB --cask \
    oracle-jdk \

brew $ACTION_VERB --cask \
    jad \

/usr/libexec/java_home -V

/usr/libexec/java_home -v 1.8

export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.zshrc

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.bashrc

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.bash_profile

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.zsh_profile

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.profile

java -version
javac -version

# https://github.com/AdoptOpenJDK/homebrew-openjdk/issues/106
brew untap adoptopenjdk/openjdk
brew untap caskroom/versions

ls -al /Library/Java/JavaVirtualMachines/
# total 0
# drwxr-xr-x  3 root  wheel   96 Apr  7 16:16 adoptopenjdk-8.jdk
# rwxr-xr-x  3 root  wheel   96 Feb 21 19:14 amazon-corretto-8.jdk
# rwxr-xr-x  3 root  wheel   96 Apr  7 16:26 jdk-14.jdk
# rwxr-xr-x  3 root  wheel   96 Apr  7 16:11 zulu-8.jdk

brew $ACTION_VERB --cask \
    android-sdk \
    android-platform-tools \
    android-ndk \


brew $ACTION_VERB --cask \
    android-studio \
    android-file-transfer \
    androidtool \


ls -al $HOME/Library/Android/sdk/


#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    cocoapods \

#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    node \
    mkcert \

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
    protonvpn \

brew $ACTION_VERB \
    bond \
    protobuf \
    avro-tools \
    

brew upgrade
brew update

#----------------------------------------------------------------------------------------------
# communications
# IM
brew $ACTION_VERB --cask \
    slack \
    microsoft-teams \
    gitter \
    android-messages \
    google-hangouts \
    discord \
    telegram \
    signal \

    
brew $ACTION_VERB --cask \
    master-pdf-editor \
    foxit-pdf-editor \
    pdf-expert \
    pdfpen \
    sejda-pdf \

brew $ACTION_VERB --cask \
    microsoft-office \
    thunderbird \

brew $ACTION_VERB --cask \
    dash \


#----------------------------------------------------------------------------------------------
# act - github actions 
brew $ACTION_VERB \
    gitlab-runner \ 
    act \

brew \
    services start \
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
