#!/bin/bash

URLS=\
"\
	http://go.microsoft.com/fwlink/?LinkID=257234&clcid=0x409 \
	
"    
    
    
for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done


