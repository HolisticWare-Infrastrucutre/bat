#!bin/bash

script_name=$0
script_full_path=$(dirname "$0")

osascript \
    $script_full_path/finder-open-new-window.scpt

osascript \
    $HOME/bat/03-productivity/mac/$BOXNAME/finder-open-new-window.scpt
osascript \
    $HOME/bat/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt
osascript \
    $HOME/bat.private/03-productivity/mac/$BOXNAME/finder-window-add-tabs-09-private-e-external.scpt
