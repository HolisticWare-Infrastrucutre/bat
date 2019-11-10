#!/bin/bash

# https://www.osboxes.org/vmware-images/
# https://www.osboxes.org/virtualbox-images/
# http://www.trendsigma.net/vmware/
# https://sourceforge.net/projects/virtualboximage/files/
# https://virtualboxes.org/images/
# https://virtualboximages.com/

# modern IE
# https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/#downloads

URLS=\
"\
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE8/Windows/IE8.Win7.For.Windows.VirtualBox.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VMware/IE8/Windows/IE8.Win7.For.Windows.VMware.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/Parallels/IE8/Mac/IE8.Win7.For.Mac.Parallels.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE9/Windows/IE9.Win7.For.Windows.VirtualBox.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VMware/IE9/Windows/IE9.Win7.For.Windows.VMware.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/Parallels/IE9/Mac/IE9.Win7.For.Mac.Parallels.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE10/Windows/IE10.Win7.For.Windows.VirtualBox.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VMware/IE10/Windows/IE10.Win7.For.Windows.VMware.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/Parallels/IE10/Mac/IE10.Win7.For.Mac.Parallels.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Windows/IE11.Win7.For.Windows.VirtualBox.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VMware/IE11/Windows/IE11.Win7.For.Windows.VMware.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/Parallels/IE11/Mac/IE11.Win7.For.Mac.Parallels.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VirtualBox/IE11/Windows/IE11.Win8.1.For.Windows.VirtualBox.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/VMware/IE11/Windows/IE11.Win8.1.For.Windows.VMware.zip \
https://az412801.vo.msecnd.net/vhd/VMBuild_20141027/Parallels/IE11/Mac/IE11.Win8.1.For.Mac.Parallels.zip \
https://az792536.vo.msecnd.net/vms/VMBuild_20160802/VirtualBox/MSEdge/MSEdge.Win10_RS1.VirtualBox.zip \
https://az792536.vo.msecnd.net/vms/VMBuild_20160802/VMWare/MSEdge/MSEdge.Win10_RS1.VMWare.zip \
https://az792536.vo.msecnd.net/vms/VMBuild_20160802/VMWare/MSEdge/MSEdge.Win10_RS1.VMWare.zip \
"    
    
for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done
