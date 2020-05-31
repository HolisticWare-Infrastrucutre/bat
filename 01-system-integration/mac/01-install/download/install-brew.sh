#!/bin/bash

osascript -e 'tell app "System Events" to display dialog "Install XCode"'
#osascript -e 'tell app "Finder" to display dialog "Install Xcode"'
open -a "App Store"

sudo xcodebuild -license

open https://visualstudio.microsoft.com/

cd ~
git clone https://github.com/moljac/bat.git

# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew list
brew outdated

brew update

# Download and update ALL software packages installed:

brew upgrade

# To see which files would be removed as no longer needed:

brew cleanup -n

# No response if there is nothing to clearn.

# To really remove all files no longer needed:

brew cleanup

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
killall Finder

#----------------------------------------------------------------------------------------------
# fingerprint in terminal
sudo nano /etc/pam.d/sudo
# add this at the begining
# auth       sufficient     pam_tid.so

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

# tools for development
brew $ACTION_VERB \
    tree \
    automake \
    autoconf \
    dos2unix \
    gettext	\
    libevent \
    libtool \
    pkg-config \
    pcre \
    swig \
    p7zip \

# Xamarin.Android xamarin-android repo
#   user want git from brew anyway, the apple-provided one is a fossil
brew tap \
    xamarin/xamarin-android-windeps
brew $ACTION_VERB \
    git \
    make \
    cmake \
    libtool \
    p7zip \
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

# plugins for zsh (nvm)
brew $ACTION_VERB \
    antigen \


echo \
"
#!/bin/zsh

source /usr/local/share/antigen/antigen.zsh
antigen bundle lukechilds/zsh-nvm
antigen apply
" \
>> $HOME/.zshrc

nvm install --lts
nvm use --lts

# 2 hrs
caffeinate -t 7200 &

brew cask $ACTION_VERB \
    caffeine \
    

#----------------------------------------------------------------------------------------------
#
brew $ACTION_VERB \
    git-lfs \

# Update global git config
sudo git lfs install

# Update system git config
sudo git lfs install --system

brew cask $ACTION_VERB \
    github \
    gitup \
    diffmerge \
    p4v \
    

#----------------------------------------------------------------------------------------------
brew cask $ACTION_VERB \
    powershell \

brew update

brew cask upgrade \
    powershell \

#----------------------------------------------------------------------------------------------
brew cask $ACTION_VERB \
    openssl \


brew link --force \
    openssl


brew cask $ACTION_VERB \
    parallels \
    virtualbox \
    cheatsheet \
    onyx \



#----------------------------------------------------------------------------------------------
#
brew cask $ACTION_VERB \
    visual-studio-code \
    homebrew/cask-versions/visual-studio-code-insiders \

#----------------------------------------------------------------------------------------------
# tools NTFS disks
brew cask $ACTION_VERB \
    osxfuse

brew $ACTION_VERB \
        ntfs-3g \


#----------------------------------------------------------------------------------------------
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


# https://stackoverflow.com/questions/52524112/how-do-i-install-java-on-mac-osx-allowing-version-switching

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
brew cask $ACTION_VERB \
    adoptopenjdk8

# https://github.com/Homebrew/homebrew-cask-versions/tree/master/Casks
brew tap homebrew/cask-versions

# https://docs.brew.sh/Taps#formula-with-duplicate-names
brew cask $ACTION_VERB \
    java \


brew cask $ACTION_VERB \
    homebrew/cask-versions/zulu8 \
    adoptopenjdk/openjdk/adoptopenjdk8 \
    homebrew/cask-versions/corretto8 \

brew cask $ACTION_VERB \
    oracle-jdk \

brew cask $ACTION_VERB \
    jad \

/usr/libexec/java_home -V

/usr/libexec/java_home -v 1.8

export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU

echo \
"
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> ~/.zshrc

echo \
"
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> ~/.bashrc

echo \
"
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> ~/.bash_profile

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

brew cask $ACTION_VERB \
    android-sdk \
    android-platform-tools \
    android-ndk \
    android-studio \
    android-file-transfer \
    androidtool \


ls -al ~/Library/Android/sdk/


#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    cocoapods \

#----------------------------------------------------------------------------------------------
# tools development
brew $ACTION_VERB \
    node \
    mkcert \

brew cask $ACTION_VERB \
    docker \
    docker-toolbox \
    dropbox \

#----------------------------------------------------------------------------------------------
# browsers
brew tap homebrew/cask-versions
brew cask $ACTION_VERB \
    google-chrome \
    google-chrome-canary \
    microsoft-edge \
    microsoft-edge-beta \
    firefox \
    opera \
    chromium \
    tor-browser \
    tor-browser-alpha \
    opera \
    opera-neon \
    browserosaurus \
    charles \
    chromedriver \
    opera-mobile-emulator \

brew untap homebrew/cask-versions


#----------------------------------------------------------------------------------------------
# communications
# IM
brew cask $ACTION_VERB \
    slack \
    microsoft-teams \
    gitter \
    android-messages \
    google-hangouts \

brew cask $ACTION_VERB \
    microsoft-office \
    thunderbird \

#----------------------------------------------------------------------------------------------
cd ~/Downloads/

curl -O \
    https://visualstudio.microsoft.com/thank-you-downloading-visual-studio-mac/?sku=communitymac&rel=16
	
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/3ce4af4f-f5d5-406c-a065-2ecc9bcc5fd2/353affd22a0727b476998312738ac35f/dotnet-sdk-5.0.100-preview.2.20176.6-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/f262d833-69d3-4aa1-bac1-b32075bebed3/474be39cca68cd46d3dc2cc03188f217/dotnet-sdk-5.0.100-preview.1.20155.7-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/905598d0-17a3-4b42-bf13-c5a69d7aac87/853aff73920dcb013c09a74f05da7f6a/dotnet-sdk-3.1.201-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/1f42da0e-a749-4338-ac39-5160a1f31ab0/74f8b6c934b0dc3024f336460c89e8ad/dotnet-sdk-2.1.805-osx-x64.pkg



curl -O \
    https://download.visualstudio.microsoft.com/download/pr/e486a3b0-7689-4429-8c6b-8388df41c14c/3ccd26660a01b4af7b24d77d0f4128b1/dotnet-runtime-5.0.0-preview.2.20160.6-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/777eb5e6-abe3-4bc0-a19e-22709b26193a/f8ae123ccae445af01d8747616bb6893/dotnet-runtime-5.0.0-preview.1.20120.5-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/482ac70d-c70d-4ec7-86d7-6842d20ca428/f7abefda6b8f210e77a3d25bf0433352/dotnet-runtime-3.1.3-osx-x64.pkg
curl -O \
    https://download.visualstudio.microsoft.com/download/pr/9d3edcf8-2da1-42eb-a30f-54d629c8f13f/2e967304f8f3543c7329fd53d292d076/dotnet-runtime-2.1.17-osx-x64.pkg


for f in *.pkg ; 
    do sudo installer -verbose -pkg "$f" -target /
done
# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
# https://dot.net/v1/dotnet-install.sh
# https://dot.net/v1/dotnet-install.ps1

# chmod u+x dotnet-install.sh
# ./dotnet-install.sh -c Current # 3.0
# ./dotnet-install.sh -c LTS # 2.1
# ./dotnet-install.sh -c 2.2 

if [ -d "$HOME/.dotnet" ] ; then
    export PATH="$PATH:$HOME/.dotnet" 
fi

if [ -d "$HOME/.dotnet/tools" ] ; then
    export PATH="$PATH:$HOME/.dotnet/tools" 
fi



# https://github.com/isen-ng/homebrew-dotnet-sdk-versions

brew cask uninstall \
    dotnet-sdk \
    dotnet \

brew tap isen-ng/dotnet-sdk-versions
brew cask $ACTION_VERB \


brew cask install \
    dotnet-sdk-3.1.200 \
    dotnet-sdk-3.1.100 \
    dotnet-sdk-3.0.100 \
    dotnet-sdk-2.2.400 \
    dotnet-sdk-2.2.300 \
    dotnet-sdk-2.2.200 \
    dotnet-sdk-2.2.100 \
    dotnet-sdk-2.1.800 \
    dotnet-sdk-2.1.500 \
    dotnet-sdk-2.1.400 \

brew untap isen-ng/dotnet-sdk-versions


echo \
'export PATH="$PATH:/usr/local/share/dotnet"' \
>> ~/.bashrc
echo \
'export PATH="$PATH:/usr/local/share/dotnet"' \
>> ~/.bash_profile
echo \
'export PATH="$PATH:/usr/local/share/dotnet"' \
>> ~/.zshrc

dotnet --list-sdks

brew cask $ACTION_VERB \
    visual-studio \


#----------------------------------------------------------------------
#




#----------------------------------------------------------------------------------------------

# if you receive this Error: Cask 'dotnet-sdk' conflicts with 'dotnet'.
# then you have to uninstall dotnet first:
# brew cask uninstall \
#     dotnet
# brew cask install \
#     dotnet-sdk



# to remove all the packages installed but keep Homebrew around one
# could also do something like:

# brew list -1 | xargs brew rm


#----------------------------------------------------------------------------------------------
# https://blog.shvetsov.com/2014/11/homebrew-cheat-sheet-and-workflow.html

brew cask $ACTION_VERB \
        db-browser-for-sqlite

#----------------------------------------------------------------------------------------------
brew tap homebrew/science # adds another source for applications.
brew $ACTION_VERB \
    octave \
    R \

brew cask $ACTION_VERB \
    r \
    rstudio \

echo "alias rstudio='open -a RStudio'" >> ~/.bash_profile
source ~/.bash_profile
echo "alias rstudio='open -a RStudio'" >> ~/.zshrc
source ~/.zshrc



#----------------------------------------------------------------------------------------------
brew $ACTION_VERB \
            python \
            python3 \

python --version
python3 --version
which pip
which pip3

sudo pip3 install --upgrade pip


# python packages: Scientific computing:
pip3 install numpy
pip3 install scipy
pip3 install sympy
python -c 'import numpy ; numpy.test();'
python -c 'import scipy ; scipy.test();'

# python packages: Data management:
pip3 install pandas


# python packages: plotting
pip3 install matplotlib
#brew $ACTION_VERB \
#    homebrew/python/matplotlib \
#    --with-cairo \
#    --with-tex

  pip3 install --upgrade pip
  pip3 install jupyter

  pip3 install --upgrade pip
  pip3 install jupyter



#----------------------------------------------------------------------------------------------
# security
# https://github.com/sidaf/homebrew-pentest

brew $ACTION_VERB \
    aircrack-ng \

brew cask $ACTION_VERB \
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
" >> ~/.bash_profile

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
" >> ~/.bashrc

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
" >> ~/.zshrc


#----------------------------------------------------------------------------------------------

# zsh compinit: insecure directories, run compaudit for list.
for f in $(compaudit);do sudo chown $(whoami):admin $f;done;

#----------------------------------------------------------------------------------------------

