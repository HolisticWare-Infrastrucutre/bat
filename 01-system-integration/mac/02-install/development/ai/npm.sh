#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

npm \
    $ACTION_VERB \
        -g \
            @vybestack/llxprt-code
