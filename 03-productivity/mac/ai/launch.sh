#! /bin/bash


if [ $@ = "" ]; then
    export FOLDER_NAME=.
else
    export FOLDER_NAME=$1
fi

osascript -e \
'
tell app "Terminal" to do script "claude"
'

osascript -e \
'
tell app "Terminal" to do script "gemini"
'

osascript -e \
'
tell app "Terminal" to do script "qwen"
'

cursor          $FOLDER_NAME
code            $FOLDER_NAME
surf            $FOLDER_NAME
code-insiders   $FOLDER_NAME