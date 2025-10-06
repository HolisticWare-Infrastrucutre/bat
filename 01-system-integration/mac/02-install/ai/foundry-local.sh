

brew \
    tap \
        microsoft/foundrylocal

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew \
    $ACTION_VERB \
        --formula \
            foundrylocal