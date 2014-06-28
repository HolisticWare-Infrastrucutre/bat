#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net
#		vNext
#			2014-06-25
# -----------------------------------------------------------------------------------

CERTMGR=/usr/local/bin/certmgr
sudo $CERTMGR -ssl -m https://go.microsoft.com
sudo $CERTMGR -ssl -m https://nugetgallery.blob.core.windows.net
sudo $CERTMGR -ssl -m https://nuget.org
sudo $CERTMGR -ssl -m https://www.myget.org/F/aspnetvnext/

mozroots --import --sync


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


