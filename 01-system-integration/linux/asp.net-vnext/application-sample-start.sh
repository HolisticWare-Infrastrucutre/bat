#!/bin/bash

cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/

echo ========================================================================================
cat ./Nowin.vNext/project.json
echo ========================================================================================
cat ./helloworld/project.json
echo ========================================================================================
echo ========================================================================================
echo ========================================================================================
echo ========================================================================================

cd helloworldweb/
kpm --verbose restore 
k web

cd hellomvc/
kpm restore ;  k web

# cd HelloWorld/
cd HelloMvc-from-Home-repo
kpm restore ;  k web2


PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/
export KRE_TRACE=1 
k web2