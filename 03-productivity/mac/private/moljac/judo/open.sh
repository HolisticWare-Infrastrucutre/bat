#!/bin/bash

export FOLDERS_PRIVATE_JUDO=\
"
/Volumes/xFAT-1TB-2/e/personal-private/judo
/Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/02-kaznena-prijava-koraci/TODO/mails
/Volumes/xFAT-1TB-2/e/personal-private/judo/HJS/01-pravno/DORH/03-kaznene-prijave-protiv-mene/04-hoo-krajac-slapp-tuzba-kleveta
"

# $HOME/.config/ghostty/config 

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

idx=1

for FOLDER in $FOLDERS_PRIVATE_JUDO
do
    if [[ $FOLDER == "#"* ]]
    then
        echo "......................................................................"
        echo $FOLDER
        continue
    fi

    if [[ $idx == 1 ]]
    then
        open \
            -n -a ghostty \
                $FOLDER \
                --args \

    else
        open \
            -a ghostty \
                $FOLDER \

    fi

    idx=$((idx + 1))
done


#        open \
#            -na ghostty \
#                --args \
#                --title="$FOLDER" \
#                --working-directory="$FOLDER"
#
#        open \
#            -na ghostty \
#                --args \
#                --title="$FOLDER" \
#                --working-directory="$FOLDER"


#                --args \
#                    --working-directory=$FOLDER \
#                    --keybind=global:ctrl+alt+enter=new_window
