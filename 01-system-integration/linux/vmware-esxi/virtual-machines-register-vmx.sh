#!/bin/bash

# http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2012964
# http://robertbchase.blogspot.com/2008/12/vmware-esxi-ssh-cli-commands.html
# http://linux.cloudibee.com/2008/11/vmware-2-0-cli-management-utility/

cat /etc/vmware/hostd/vmInventory.xml
vim-cmd vmsvc/getallvms

# Skipping invalid VM '16'
# Skipping invalid VM '32'
# Skipping invalid VM '48'
# Skipping invalid VM '64'


vim-cmd vmsvc/unregister 16
vim-cmd vmsvc/unregister 32
vim-cmd vmsvc/unregister 48
vim-cmd vmsvc/unregister 64

vim-cmd vmsvc/unregister 16
# 	(vim.fault.NotFound) {
# 	   dynamicType = <unset>,
# 	   faultCause = (vmodl.MethodFault) null,
# 	   msg = "Unable to find a VM corresponding to "16"",
# 	}

vim-cmd vmsvc/destroy 16
vim-cmd vmsvc/destroy 32
vim-cmd vmsvc/destroy 48
vim-cmd vmsvc/destroy 64


vim-cmd solo/registervm \
	/vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-centos-6_5/mono-asp-net-vnext-centos-6_5.vmx
vim-cmd solo/registervm \
	/vmfs/volumes/datastore2_maxtor_120GB/test-services-centos-6_5/test-services-centos-6_5.vmx
vim-cmd solo/registervm \
	/vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-ubuntu-s-14_0/mono-asp-net-vnext-ubuntu-s-14_0.vmx
vim-cmd solo/registervm \
	/vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-debian-7_5/mono-asp-net-vnext-debian-7_5.vmx
vim-cmd solo/registervm \
	/vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-suse-13_1/mono-asp-net-vnext-suse-13_1.vmx

cat /etc/vmware/hostd/vmInventory.xml
vim-cmd vmsvc/getallvms


# Vmid                 Name                                                              File                                                   Guest OS     Version   Annotation
#112    mono-asp-net-vnext-ubuntu-s-14_0   [datastore2_maxtor_120GB] mono-asp-net-vnext-ubuntu-s-14_0/mono-asp-net-vnext-ubuntu-s-14_0.vmx   ubuntuGuest    vmx-07
#128    mono-asp-net-vnext-debian-7_5      [datastore2_maxtor_120GB] mono-asp-net-vnext-debian-7_5/mono-asp-net-vnext-debian-7_5.vmx         debian5Guest   vmx-07
#144    mono-asp-net-vnext-suse-13_1       [datastore2_maxtor_120GB] mono-asp-net-vnext-suse-13_1/mono-asp-net-vnext-suse-13_1.vmx           sles11Guest    vmx-07
#80     mono-asp-net-vnext-centos-6_5      [datastore2_maxtor_120GB] mono-asp-net-vnext-centos-6_5/mono-asp-net-vnext-centos-6_5.vmx         centosGuest    vmx-07
#96     test-services-centos-6_5           [datastore2_maxtor_120GB] test-services-centos-6_5/test-services-centos-6_5.vmx                   centosGuest    vmx-07




# ls -al  /vmfs/volumes/datastore2_maxtor_120GB/
# drwxr-xr-t    1 root     root               1820 Oct 23 15:04 .
# drwxr-xr-x    1 root     root                512 Nov  4 14:19 ..
# drwxr-xr-x    1 root     root               2240 Nov  4 13:18 mono-asp-net-vnext-centos-6_5
# drwxr-xr-x    1 root     root               1960 Nov  4 13:18 mono-asp-net-vnext-debian-7_5
# drwxr-xr-x    1 root     root               1820 Nov  4 13:19 mono-asp-net-vnext-suse-13_1
# drwxr-xr-x    1 root     root               2240 Nov  4 13:19 mono-asp-net-vnext-ubuntu-s-14_0
# drwxr-xr-x    1 root     root               2240 Nov  4 13:19 test-services-centos-6_5
# 
# 
# find  /vmfs/volumes/datastore2_maxtor_120GB/ -name "*.vmx"
# /vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-centos-6_5/mono-asp-net-vnext-centos-6_5.vmx
# /vmfs/volumes/datastore2_maxtor_120GB/test-services-centos-6_5/test-services-centos-6_5.vmx
# /vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-ubuntu-s-14_0/mono-asp-net-vnext-ubuntu-s-14_0.vmx
# /vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-debian-7_5/mono-asp-net-vnext-debian-7_5.vmx
# /vmfs/volumes/datastore2_maxtor_120GB/mono-asp-net-vnext-suse-13_1/mono-asp-net-vnext-suse-13_1.vmx


cat /etc/vmware/hostd/vmInventory.xml

/etc/init.d/vpxa restart
/etc/init.d/hostd restart 


vim-cmd vmsvc/getallvms
cd /etc/vmware/hostd/
cp vmInventory.xml vmInventory.xml.bak.20141105

/etc/init.d/vpxa stop
/etc/init.d/hostd stop



/etc/init.d/vpxa start
/etc/init.d/hostd start 



















