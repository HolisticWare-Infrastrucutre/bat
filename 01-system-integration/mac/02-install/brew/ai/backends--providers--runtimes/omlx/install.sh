#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew \
    tap \
        jundot/omlx https://github.com/jundot/omlx

brew \
    $ACTION_VERB \
        --formula \
            omlx

brew cleanup
brew doctor
           