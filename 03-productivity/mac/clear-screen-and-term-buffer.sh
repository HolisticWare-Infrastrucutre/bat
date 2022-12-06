#!bin/bash

clear \
    && \
printf '\e[3J' \
    && \
printf '\33c\e[3J' \
    && \
/usr/bin/osascript \
    -e 'tell application "System Events" to tell process "Terminal" to keystroke "k" using command down'