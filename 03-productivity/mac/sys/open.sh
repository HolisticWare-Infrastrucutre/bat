#!/bin/bash

export FOLDERS_SYS=\
"
$HOME
$HOME/bat/
$HOME/bat.private/
$HOME/bin/
"

# $HOME/.config/ghostty/config 

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

idx=1

for FOLDER in $FOLDERS_SYS
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
