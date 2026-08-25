#!/bin/bash

export DIR_CURRENT=$(pwd)


ttab \
    -w \
    -d $DIR_CURRENT

ttab \
    -d $DIR_CURRENT \
    whichllm

ttab \
    -d $DIR_CURRENT \
    llmfit


