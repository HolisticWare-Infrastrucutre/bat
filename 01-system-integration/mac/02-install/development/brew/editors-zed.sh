#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

# https://hndrbs.xyz/blog/zed-and-csharp/

# https://github.com/OmniSharp/homebrew-omnisharp-roslyn

# https://www.omnisharp.net/#about

# https://github.com/omnisharp

brew tap omnisharp/omnisharp-roslyn

brew update

brew \
    $ACTION_VERB \
        --formula \
            omnisharp

brew \
    $ACTION_VERB \
        --cask \
            zed
