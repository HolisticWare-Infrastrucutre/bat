#!/bin/bash

# ollama list | tail -n +2 | awk '{print $1}' | xargs -I {} ollama pull {}

ollama list \
| \
awk 'NR>1 {print $1}' \
| \
xargs -I {} sh -c 'echo "Updating model: {}"; ollama pull {}; echo "--"' \
&& \
echo "All models updated."
