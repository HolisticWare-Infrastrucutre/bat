#!/bin/bash

cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/

#cd hellowordweb/
# cd HelloWorld/
cd HelloMvc-from-Home-repo

PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/
export KRE_TRACE=1 
k web2