#!/bin/bash

#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

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
    install \
        --formula \
            node \
            npm-check-updates \
            yarn


brew \
    tap \
        oven-sh/bun
brew \
    install \
        --formula \
            bun \

# brew \
#     install \
#         --formula \
#             oven-sh/bun/bun

npm \
    install \
        -g \
            npx