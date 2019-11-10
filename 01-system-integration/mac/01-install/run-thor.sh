#!/bin/bash

curl            icanhazip.com      # Your Original IP

brew services start tor
torsocks curl   icanhazip.com      # Your IP over Tor


# torify wget     http://judo.hr
# torsocks wget   http://judo.hr
# usewithtor wget http://judo.hr


# https://gist.github.com/dannguyen/03a10e850656577cfb57

torify \
    wget \
        --mirror \
        --recursive \
        --html-extension \
        --adjust-extension \
        --convert-links \
        -e robots=off \
        -E png,jpg \
        --restrict-file-names=windows \
        --domains judo.hr,rackcdn.com \
        http://judo.hr/organisation


#        -A html,pdf,doc,docx \
#        --no-parent \
#        --page-requisites \
#        --span-hosts \
#        --no-clobber \
#
#        -E jpg,jpeg,JPG,JPEG,png,PNG \


# https://511e496608e9046b72fd-6d4ed19004fcfb8be918d73f9d6148bc.ssl.cf3.rackcdn.com/files/web/9/obrazac-ucenicki-kyu-pojasevi.doc