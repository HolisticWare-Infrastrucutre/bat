#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

cd /tmp
rm -fr Mono.ASP.net.vNext/
git clone --recursive git://github.com/moljac/Mono.ASP.net.vNext.git
cd Mono.ASP.net.vNext/
git submodule status

cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/

#cd hellowordweb/
# cd HelloWorld/
cd HelloMvc-from-Home-repo

kpm restore ; kpm restore -s https://www.myget.org/F/aspnetvnext/

# on Windows or
# SET KRE_TRACE=1 
# on OSX/Linux
PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/
export KRE_TRACE=1 
/sbin/ifconfig ; k web2




cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/

#cd hellowordweb/
# cd HelloWorld/
cd HelloMvc-from-Home-repo
export KRE_TRACE=1 
/sbin/ifconfig ; k web2
