#!bin/bash

script_name=$0
script_full_path=$(dirname "$0")

osascript \
    $script_full_path/finder-open-new-window.scpt
