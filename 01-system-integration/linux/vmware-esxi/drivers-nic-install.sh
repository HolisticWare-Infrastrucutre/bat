#!/bin/bash


# For ESXi/ESX 5.x, run the command:
esxcli software vib install -d offline-bundle.zip

# For ESXi/ESX 3.5 and 4.x, run the command:
esxupdate --bundle=bundlename.zip update


ls -al /vmfs/volumes/


/vmfs/volumes/datastore1/drivers-nic-realtek
