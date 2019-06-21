#!/bin/bash

SAVEIFS=$IFS
IFS=$'\n'

DIR_INPUT=/Volumes/BCKPMAC2013/multimedia/mp4
DIR_OUTPUT=/Volumes/BCKPMAC2013/multimedia/mp3

FILES=$DIR_INPUT/*

for file in $FILES; do
    echo file input : "$file"
    file_out="${file/mp4/mp3}"
    file_out="${file_out/mp4/mp3}"
    echo file output: $file_out
    SS=""
    if [[ $file_out = *"Moracchioli"* ]]; then
        ffmpeg -ss 5 -i "$file" $file_out
    else
        ffmpeg -i "$file" $file_out
    fi

done


# restore $IFS
IFS=$SAVEIFS


ffmpeg \
    -ss 5 \
    -i "/Volumes/BCKPMAC2013/multimedia/mp4/(Don´t Fear) The Reaper (metal cover by Leo Moracchioli).mp4" \
    "/Volumes/BCKPMAC2013/multimedia/mp3/(Don´t Fear) The Reaper (metal cover by Leo Moracchioli).mp3"
