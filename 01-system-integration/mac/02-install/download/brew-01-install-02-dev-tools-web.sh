#!/bin/bash

#!/bin/bash

# Action/Verb
# $ACTION_VERB / uninstall / reinstall
export ACTION_VERB=$ACTION_VERB

# https://gist.github.com/rcugut/c7abd2a425bb65da3c61d8341cd4b02d
m -rf /usr/local/lib/node_modules

# remove previously installed node
brew \
    uninstall \
        node
# clean all broken symlinks
brew prune
# always good to have the latest
brew update

brew \
    $ACTION_VERB \
        --formula \
            node \
            npm-check-updates \
            yarn


brew \
    tap \
        oven-sh/bun
brew \
    $ACTION_VERB \
        --formula \
            bun \

# brew \
#     $ACTION_VERB \
#         --formula \
#             oven-sh/bun/bun

npm \
    $ACTION_VERB \
        -g \
            npx

brew \
    $ACTION_VERB \
        --formula \
            kiota
