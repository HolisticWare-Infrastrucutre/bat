#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update




# ==> cmake
# To install the CMake documentation, run:
#   brew install cmake-docs
# 
# ==> make
# GNU "make" has been installed as "gmake".
# If you need to use it as "make", you can add a "gnubin" directory
# to your PATH from your bashrc like:
# 
     PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
# 
# ==> libtool
# All commands have been installed with the prefix "g".
# If you need to use these commands with their normal names, you
# can add a "gnubin" directory to your PATH from your bashrc like:
#   PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
# 
# ==> coreutils
# Commands also provided by macOS and the commands dir, dircolors, vdir have been installed with the prefix "g".
# If you need to use these commands with their normal names, you can add a "gnubin" directory to your PATH with:
   PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# 
# ==> findutils
# All commands have been installed with the prefix "g".
# If you need to use these commands with their normal names, you
# can add a "gnubin" directory to your PATH from your bashrc like:
   PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
# 
# ==> gnu-tar
# GNU "tar" has been installed as "gtar".
# If you need to use it as "tar", you can add a "gnubin" directory
# to your PATH from your bashrc like:
# 
     PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
# 
# ==> gnu-sed
# GNU "sed" has been installed as "gsed".
# If you need to use it as "sed", you can add a "gnubin" directory
# to your PATH from your bashrc like:
# 
     PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# 
# ==> gawk
# GNU "awk" has been installed as "gawk".
# If you need to use it as "awk", you can add a "gnubin" directory
# to your PATH from your ~/.bashrc and/or ~/.zshrc like:
# 
     PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
# 
# ==> gnutls
# Guile bindings are now in the `guile-gnutls` formula.
# 
# ==> gnu-indent
# GNU "indent" has been installed as "gindent".
# If you need to use it as "indent", you can add a "gnubin" directory
# to your PATH from your bashrc like:
# 
     PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
# 
# ==> gnu-getopt
# gnu-getopt is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides BSD getopt.
# 
# If you need to have gnu-getopt first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"' >> ~/.zshrc
# 