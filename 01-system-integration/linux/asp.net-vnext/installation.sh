#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

../mono-installation/mono-install-common-certificates.sh

# http://httpkit.com/resources/HTTP-from-the-Command-Line/
#
# curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh && source ~/.kre/kvm/kvm.sh && kvm upgrade


rm -rf ~/.kre/
rm -rf ~/.kpm/
find / -name "kvminstall.sh" 	| xargs rm -fr
find / -name "kvm.sh"			| xargs rm -fr

unset -f _kvm_download
unset -f 
unset -f 
unset -f 
unset -f 
unset -f 
unset -f 
unset -f 


# unzip needed!!!
 curl --header "cache-control: no-cache" https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh
# curl \
# 	--header "cache-control: no-cache" \
# 	https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh > kvminstall.sh
chmod 700 kvminstall.sh
./kvminstall.sh
find / -name "kvminstall.sh"
source ~/.kre/kvm/kvm.sh 

#=================================================================================
# reloading bashrc without logout/login
source ~/.bashrc
#		shorter version of the command:
. ~/.bashrc
exec bash
#=================================================================================


find / -name "kvm.sh" 	| xargs ls -al
#find / -name "kvm.sh" 	| xargs less
find / -name "kvm.sh" 	| xargs cat
yes | kvm upgrade

kvm list




echo $PATH


export KRE_TRACE=1
LD_LIBRARY_PATH=/usr/local/lib/
export LD_LIBRARY_PATH
kpm restore
kpm restore -s https://www.myget.org/F/aspnetvnext/


















curl \
-s "https://www.myget.org/F/aspnetmaster/api/v2/GetUpdates()?packageIds='KRE-mono45-x86'&versions='0.0'&includePrerelease=true&includeAllVersions=false"