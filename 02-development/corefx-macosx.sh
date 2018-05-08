
brew list
brew install

rm -fr \
    /usr/local/etc/bash_completion.d/brew \
    /usr/local/share/zsh/site-functions/_brew \
    /usr/local/share/man/man1/brew.1 \
    /usr/local/share/doc/homebrew \
    
brew update 

brew install \
    cmake \
    pkgconfig \
    openssl \
    
    