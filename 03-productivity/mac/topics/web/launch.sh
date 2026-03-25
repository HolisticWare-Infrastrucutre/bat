#! /bin/bash


if [ $@ = "" ]; then
    export FOLDER_NAME=.
else
    export FOLDER_NAME=$1
fi

osascript -e \
'
tell app "Terminal" to do script "dev_dotnet_workload_reinstall"
'
sleep 3

osascript -e \
'
tell app "Terminal" to do script "dev_dotnet_new_templates_reinstall"
'
sleep 3

osascript -e \
'
tell app "Terminal" to do script "dev_dotnet_tools_reinstall"
'

cursor          $FOLDER_NAME
code            $FOLDER_NAME
surf            $FOLDER_NAME
code-insiders   $FOLDER_NAME