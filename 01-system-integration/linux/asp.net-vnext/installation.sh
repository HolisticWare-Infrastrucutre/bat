#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

../mono-installation/mono-install-common-certificates.sh

curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh && source ~/.kre/kvm/kvm.sh && kvm upgrade

# unzip needed!!!
curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh
source ~/.kre/kvm/kvm.sh 
kvm upgrade


export KRE_TRACE=1
LD_LIBRARY_PATH=/usr/local/lib/
export LD_LIBRARY_PATH
kpm restore
kpm restore -s https://www.myget.org/F/aspnetvnext/


