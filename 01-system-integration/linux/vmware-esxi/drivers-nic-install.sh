#!/bin/bash


# For ESXi/ESX 5.x, run the command:
esxcli software vib install -d offline-bundle.zip

# For ESXi/ESX 3.5 and 4.x, run the command:
esxupdate --bundle=bundlename.zip update


ls -al /vmfs/volumes/

ls -al /vmfs/volumes/datastore1/drivers-nic-realtek

esxcli \
	software vib install \
	-v \
	/vmfs/volumes/datastore1/drivers-nic-realtek/VMware_bootbank_net-r8169_6.011.00-2vmw.510.0.0.799733.vib
	
esxcli \
	software vib install \
	-v \
	/vmfs/volumes/datastore1/drivers-nic-realtek/VMware_bootbank_net-r8168_8.013.00-3vmw.510.0.0.799733.vib