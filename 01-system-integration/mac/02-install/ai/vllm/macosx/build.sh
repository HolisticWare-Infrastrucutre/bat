#!/bin/bash

export URL=https://github.com/vllm-project/vllm/archive/refs/heads/master.zip

export FOLDER=$HOME/Downloads/vllm/macosx/
rm -fr  $FOLDER
md      $FOLDER

curl \
    -v -L -C - \
    -o $FOLDER/vllm.zip \
    -O $URL
  
unzip \
    $FOLDER/vllm.zip \
    -d $FOLDER/vllm-master/

cd $FOLDER/vllm-master/

# git clone https://github.com/vllm-project/vllm.git
uv pip install -r requirements/cpu.txt --index-strategy unsafe-best-match
uv pip install -e .

python -m venv .venv
source .venv/bin/activate
pip install -r requirements/cpu.txt
pip install -e .
