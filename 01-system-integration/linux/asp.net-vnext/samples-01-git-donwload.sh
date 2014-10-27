#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/

cd /tmp
rm -fr Mono.ASP.net.vNext/
git clone --recursive git://github.com/moljac/Mono.ASP.net.vNext.git
git submodule status

git clone https://github.com/moljac/ASP.net.vNext.davidfowl.HelloWorldVNext.git
cd ASP.net.vNext.davidfowl.HelloWorldVNext/src/



cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/


