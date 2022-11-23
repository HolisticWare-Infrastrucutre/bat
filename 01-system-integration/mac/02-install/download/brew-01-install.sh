#!/bin/bash

source ./brew-00-prepare.sh

# Action/Verb
# $ACTION_VERB / un$ACTION_VERB / re$ACTION_VERB
export ACTION_VERB=$ACTION_VERB

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES && killall Finder
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO && killall Finder
defaults write com.apple.finder NewWindowTargetPath \
        -string "file://localhost/Users//Shared/Projects/"
killall Finder




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

#----------------------------------------------------------------------------------------------
# fingerprint in terminal
sudo nano /etc/pam.d/sudo
# add this at the begining
# auth       sufficient     pam_tid.so

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

brew $ACTION_VERB --cask \
    the-unarchiver \

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

nvm $ACTION_VERB --lts
nvm use --lts

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
    parallels \
    virtualbox \
    cheatsheet \
    onyx \
    diffmerge \

brew $ACTION_VERB \
    caskformula/caskformula/inkscape
brew $ACTION_VERB --cask \
    inkscape \
    vlc \


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

brew $ACTION_VERB --cask \
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

brew $ACTION_VERB --cask \
    dropbox \


brew $ACTION_VERB --cask \
    virtualbox \

# 
#    docker \
#    docker-machine \
#    docker-toolbox \

boots https://desktop.docker.com/mac/stable/amd64/Docker.dmg

pip3 $ACTION_VERB docker-compose
open -a Docker
docker-compose

docker --version
docker-compose --version
docker-machine --version

docker ps

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
    firefox-beta \
    firefox-developer-edition \
    firefox-nightly \
    opera \
    opera-beta \
    opera-developer \
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

brew $ACTION_VERB --cask \
    microsoft-edge \
    microsoft-edge-dev \
    microsoft-edge-beta \
    google-chrome \
    google-chrome-canary \
    firefox \
    firefox-developer-edition \



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

#----------------------------------------------------------------------------------------------
cd ~/Downloads/


brew $ACTION_VERB \
    mono-libgdiplus

# export COMMAND="wget"
# export COMMAND="curl -OL"
export COMMAND="boots"


dotnet --list-runtimes
dotnet --list-sdks

boots \
    https://www.eid.hr/sites/default/files/akdeid-3.10-20200316.pkg

export PKGS="
# 6
    https://download.visualstudio.microsoft.com/download/pr/14a45451-4cc9-48e1-af69-0aff75891d09/ff6e83986a2a9a535015fb3104a90a1b/dotnet-sdk-6.0.100-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/ed60d37e-7842-4fc2-8250-2bd66073d79e/725d486e04d27e45d2b41c687dc35f49/dotnet-sdk-6.0.100-osx-arm64.pkg
    https://download.visualstudio.microsoft.com/download/pr/03e62824-4061-45dc-8777-93e82205148d/81489074c065675bd713a9cbeb995bef/dotnet-runtime-6.0.0-osx-x64.pkg

#   https://download.visualstudio.microsoft.com/download/pr/3336b6fe-1f40-4c66-a1ef-81cabd3df46c/dd56dc201e5c0a95b86f41c1cf36df17/dotnet-sdk-6.0.100-rc.2.21505.57-osx-arm64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/c5dd0b51-0059-442b-9456-b03cb7ee277d/6d78d81224db93247ff6ae0bdb929712/dotnet-sdk-6.0.100-rc.2.21505.57-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/2ac2aeec-4262-41e1-9544-8fc21579952c/8bfe416a0ce0b43b354481cacaa57f35/dotnet-runtime-6.0.0-rc.2.21480.5-osx-arm64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/39fb50be-17b9-45b2-9f3e-eb03e31b8219/3f67fc8d06a1d163ac817cd116fd4719/dotnet-runtime-6.0.0-rc.2.21480.5-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/cade10b2-d8f7-443a-89f0-33339849fe7b/14ef830b7edb0234234b1b8203ceea81/dotnet-sdk-6.0.100-rc.1.21458.32-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/8bcf6158-61fc-4e4c-bfda-8f3723b3590d/9e21a5527ca29d20ca3868e4423c7d99/dotnet-runtime-6.0.0-rc.1.21451.13-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/9e02abfd-b421-4c43-8541-482f037ed19c/f61bd4f35c444710016db8b5a7206a97/dotnet-sdk-6.0.100-preview.7.21379.14-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/f3f28827-7599-4d5e-a218-348e3988e27f/cbc1fe0c1d29f48f9b75591e95823d42/dotnet-runtime-6.0.0-preview.7.21377.19-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/62a705de-f063-4dc1-912b-6727ab3295cd/a3845e7371b03fa813384d0e16ebaa20/dotnet-runtime-6.0.0-preview.1.21102.12-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/f7224456-9898-45b6-8acc-b110900653cd/817c4e3b1ee787985fdf85032eb2752d/dotnet-sdk-6.0.100-preview.1.21103.13-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/51cb50a7-c2e6-49f9-a172-e1dd0dd0f40f/d3cd57a2fc52ff8e85d8f52ba27f2e2f/dotnet-runtime-6.0.0-preview.2.21154.6-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/5e10dc75-294e-49f4-972e-218ae86191a3/e46d3533c30c8a864252a334820263a9/dotnet-sdk-6.0.100-preview.2.21155.3-osx-x64.pkg
#   https://download.visualstudio.microsoft.com/download/pr/6b0ffd8c-781a-426d-ae29-48f602d2dc64/c129b2832dbb09ea92f11cc7d91bd714/dotnet-runtime-6.0.0-preview.3.21201.4-osx-x64.tar.gz
#   https://download.visualstudio.microsoft.com/download/pr/fc5fdd1f-fb4c-4b88-a507-158204030320/98497ef248883404ff5b0604dda944fb/dotnet-sdk-6.0.100-preview.3.21202.5-osx-x64.pkg
# 5
    https://download.visualstudio.microsoft.com/download/pr/88bc1553-e90f-4a4f-9574-65d9a5065cd2/1d5646e1abb8b4d4a61ba0b0be976047/dotnet-sdk-5.0.402-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/8d55e3f5-8dd7-455f-9598-7128496e8509/8e2a0342882d0602cd8780d872ba4b80/dotnet-sdk-5.0.208-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/f241f934-a4cc-400a-8d03-a5ab50c25fea/1c8600ad088a42b157c073454e80039a/dotnet-runtime-5.0.11-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/543144ce-10ad-4396-a464-28c440f8fe22/29bd5273237ed3a408aef1f8aacd239b/dotnet-sdk-5.0.400-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/a847df19-d530-41c8-b766-cb60ee8af9a4/7edd7c2eae38d25d0d7c90350eefea64/dotnet-runtime-5.0.9-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/60a8becd-ff61-4e17-8329-4d85f9d1e3b9/06ef79dad25a85905afbb3965f613bad/dotnet-runtime-5.0.3-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/a06c387d-2811-4fba-8b5f-86cb9f0bdeba/f41d1c63c5b6bcee9293484e845bc518/dotnet-sdk-5.0.200-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/c8320b32-f469-4c6b-9efe-39db01667197/c98a8dd2f5be1fca335e98c49e519fa6/dotnet-runtime-5.0.4-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/de613120-9306-4867-b504-45fcc81ba1b6/2a03f18c549f52cf78f88afa44e6dc6a/dotnet-sdk-5.0.201-osx-x64.pkg    
    https://download.visualstudio.microsoft.com/download/pr/0e2acfdc-5dad-48a8-935d-6095a0ae2217/3ffa41859dbb1ca40a7e1ff704651178/dotnet-runtime-5.0.5-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/749775e4-7b6f-4367-bb7a-9cb63a818dae/c2614b34e234fa03dc65320a8a954570/dotnet-sdk-5.0.202-osx-x64.pkg
# 3
    https://download.visualstudio.microsoft.com/download/pr/0517421d-3300-42c7-a420-e42d55068126/76b722e65c0745962156e622ed76501c/dotnet-sdk-3.1.414-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/533cf672-efe8-44a1-aa5c-eccedc497a88/9970943230ef8e983c0bddd5233a3c62/dotnet-sdk-3.1.120-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/55e76de0-b547-49c7-bdcd-12838224599e/c9b70778e5c3749b5e35fde0bf324ee3/dotnet-runtime-3.1.20-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/69d7eb12-f378-485d-8f3c-ad3a124039b8/52e9adf9e2a2900f658eea4851fb157a/dotnet-runtime-3.1.13-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/2f33d5fa-f218-46fb-8952-dc14e8f3e5f0/e955de1fe2cf72acc8052074f091d480/dotnet-sdk-3.1.113-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/61df6a9d-3026-41f9-88e3-8bc9eded713d/6a46352bc4a98d208350d65e0a02bd3a/dotnet-runtime-3.1.14-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/181bacde-297f-4d45-97a4-4d8929779e4e/6a20a4e8a2911322399b56f1695bbdc6/dotnet-sdk-3.1.114-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/ecd4efe6-5f37-4183-82a1-dd2de88ca573/144bb23aab65c4439d0600973d756e6b/dotnet-sdk-3.1.407-osx-x64.pkg
    https://download.visualstudio.microsoft.com/download/pr/99ff3282-3027-4bb8-8b96-8715d674f417/a483e65d765e3f475d009f233ddfec35/dotnet-sdk-3.1.408-osx-x64.pkg
"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for PKG in $PKGS
do
    if [[ $PKG == "#"* ]]
    then
        continue
    fi

    echo pkg: $PKG
    $COMMAND $PKG
done


dotnet --list-runtimes
dotnet --list-sdks



$COMMAND \
    https://visualstudio.microsoft.com/thank-you-downloading-visual-studio-mac/?sku=communitymac&rel=16
	
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/7a2f569c-f3be-43f7-8f5d-ccc2b62b06ca/a7f72e40a5ee418cd15fa477d30d4b30/dotnet-sdk-5.0.100-preview.7.20366.6-osx-x64.pkg
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/905598d0-17a3-4b42-bf13-c5a69d7aac87/853aff73920dcb013c09a74f05da7f6a/dotnet-sdk-3.1.201-osx-x64.pkg
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/1f42da0e-a749-4338-ac39-5160a1f31ab0/74f8b6c934b0dc3024f336460c89e8ad/dotnet-sdk-2.1.805-osx-x64.pkg

$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/e486a3b0-7689-4429-8c6b-8388df41c14c/3ccd26660a01b4af7b24d77d0f4128b1/dotnet-runtime-5.0.0-preview.2.20160.6-osx-x64.pkg
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/777eb5e6-abe3-4bc0-a19e-22709b26193a/f8ae123ccae445af01d8747616bb6893/dotnet-runtime-5.0.0-preview.1.20120.5-osx-x64.pkg
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/482ac70d-c70d-4ec7-86d7-6842d20ca428/f7abefda6b8f210e77a3d25bf0433352/dotnet-runtime-3.1.3-osx-x64.pkg
$COMMAND \
    https://download.visualstudio.microsoft.com/download/pr/9d3edcf8-2da1-42eb-a30f-54d629c8f13f/2e967304f8f3543c7329fd53d292d076/dotnet-runtime-2.1.17-osx-x64.pkg


for f in *.pkg ; 
    do sudo $ACTION_VERBer -verbose -pkg "$f" -target /
done


# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-$ACTION_VERB-script
# https://dot.net/v1/dotnet-$ACTION_VERB.sh
# https://dot.net/v1/dotnet-$ACTION_VERB.ps1

# chmod u+x dotnet-$ACTION_VERB.sh
# ./dotnet-$ACTION_VERB.sh -c Current # 3.0
# ./dotnet-$ACTION_VERB.sh -c LTS # 2.1
# ./dotnet-$ACTION_VERB.sh -c 2.2 

if [ -d "$HOME/.dotnet" ] ; then
    export PATH="$PATH:$HOME/.dotnet" 
fi

if [ -d "$HOME/.dotnet/tools" ] ; then
    export PATH="$PATH:$HOME/.dotnet/tools" 
fi



# https://github.com/isen-ng/homebrew-dotnet-sdk-versions

# brew cask un$ACTION_VERB \
#     dotnet-sdk \
#     dotnet \

brew tap isen-ng/dotnet-sdk-versions
brew $ACTION_VERB --cask \


# brew $ACTION_VERB --cask \
#     dotnet-sdk-3.1.200 \
#     dotnet-sdk-3.1.100 \
#     dotnet-sdk-3.0.100 \
#     dotnet-sdk-2.2.400 \
#     dotnet-sdk-2.2.300 \
#     dotnet-sdk-2.2.200 \
#     dotnet-sdk-2.2.100 \
#     dotnet-sdk-2.1.800 \
#     dotnet-sdk-2.1.500 \
#     dotnet-sdk-2.1.400 \

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

brew $ACTION_VERB --cask \
    visual-studio \

brew $ACTION_VERB \
    nuget \
    

#----------------------------------------------------------------------------------------------

# if you receive this Error: Cask 'dotnet-sdk' conflicts with 'dotnet'.
# then you have to un$ACTION_VERB dotnet first:
# brew cask un$ACTION_VERB \
#     dotnet
# brew cask $ACTION_VERB \
#     dotnet-sdk



# to remove all the packages $ACTION_VERBed but keep Homebrew around one
# could also do something like:

# brew list -1 | xargs brew rm


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
    homebrew/cask-versions/adoptopenjdk8 \
    scilab \

boots https://www.utc.fr/~mottelet/scilab/download/branch-6.1/scilab-branch-6.1-x86_64.dmg

brew $ACTION_VERB --cask \
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
