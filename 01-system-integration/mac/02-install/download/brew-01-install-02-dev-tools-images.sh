#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew \
    $ACTION_VERB \
        --cask \
            pngquant \
            optipng \


# optipng -o7 *.edited.zip.png


