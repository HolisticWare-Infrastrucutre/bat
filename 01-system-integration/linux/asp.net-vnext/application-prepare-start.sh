#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

cd /tmp
rm -fr Mono.ASP.net.vNext/
git clone --recursive git://github.com/moljac/Mono.ASP.net.vNext.git


cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/


#cd hellowordweb/
cd HelloWorld/

kpm restore 
kpm restore -s https://www.myget.org/F/aspnetvnext/

/sbin/ifconfig ; k web-nowin

