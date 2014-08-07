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
cd Mono.ASP.net.vNext/
git submodule status

cd /tmp
cd Mono.ASP.net.vNext/submodulez/forks-moljac/
cd ASP.net.vNext.davidfowl.HelloWolrdVNext/src/

ls -al
less Nowin.vNext/NowinServerFactory.cs
vi	 Nowin.vNext/NowinServerFactory.cs

#cd hellowordweb/
# cd HelloWorld/
cd HelloMvc-from-Home-repo

kpm restore
if [[ $? > 0 ]]; then 
   do echo mc++; 
   exit 1; 
fi
# Nowin cannot be installed from here 1st time
kpm restore -s https://www.myget.org/F/aspnetvnext/
if [[ $? > 0 ]]; then 
   do echo mc++; 
   exit 1; 
fi
# this installs nowin?!!?
kpm restore
# just to be sure
kpm restore -s https://www.myget.org/F/aspnetvnext/


kpm restore -s https://nugetgallery.blob.core.windows.net
kpm restore -s https://nuget.org
kpm restore -s https://go.microsoft.com

# on Windows or
# SET KRE_TRACE=1 
# on OSX/Linux
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
