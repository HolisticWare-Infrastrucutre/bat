#!/bin/bash

# -----------------------------------------------------------------------------------
# CentOS 
#		6.5
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
ifup eth0
# Device eth0 does not seem to be present, delaying initialisation
rm -f /etc/udev/rules.d/70-persistent-net.rules
reboot

# Remove the MACADDR entry or update it to the new MACADDR for the interface 
# (listed in this file: /etc/udev/rules.d/70-persistent-net.rules).
#
# Remove the UUID entry
vim /etc/sysconfig/networking/devices/ifcfg-eth0
# grep  /etc/sysconfig/network-scripts/ifcfg-eth0
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
sudo \
	yum -y install \
		gcc gcc-c++ automake autoconf autogen libtool make \
		bison gettext glib2 glibc-devel \
		bzip2 wget java unzip git \
		freetype fontconfig libpng libpng-devel libX11 libX11-devel glib2-devel \
		libgdi* libexif urw-fonts
# -----------------------------------------------------------------------------------
	
	
# -----------------------------------------------------------------------------------
cd /tmp

git clone git://github.com/mono/mono.git mono-git-cloned
rm -rf mono
cp -fr mono-git-cloned mono
cd mono

# if you don't have a working Mono installation, an obvious choice is to install 
#the latest released packages of 'mono' for your distribution and running 
#autogen.sh; make; make install 

# You can also try a slightly more risky approach: this may not work, so start 
# from the released tarball as detailed above.

# This works by first getting the latest version of the 'monolite' distribution, 
# which contains just enough to run the 'mcs' compiler. You do this with:

# This will download and automatically gunzip and untar the tarball, and place 
# the files appropriately so that you can then just run: 



PREFIX=/usr/local
./autogen.sh --prefix=$PREFIX
# mcs (gmcs) working cs compiler is needed for installation
# sudo for some distros that need elevated rights
sudo make get-monolite-latest

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib/
make check

sudo make install
mono -V
# -----------------------------------------------------------------------------------



# ASP.net vNext
certmgr -ssl -m https://go.microsoft.com
certmgr -ssl -m https://nugetgallery.blob.core.windows.net
certmgr -ssl -m https://nuget.org

mozroots --import --sync


curl https://raw.githubusercontent.com/graemechristie/Home/KvmShellImplementation/kvmsetup.sh | sh \
	&& \
	source ~/.kre/kvm/kvm.sh \
	&& \
	kvm upgrade


# getting started
git clone https://github.com/aspnet/Home.git
cd Home
kvmsetup
kvm install 0.1-alpha-build-0446 -p

ls -al ~/.kre/kvm/kvm.sh


mkdir 	/tmp/HelloKRuntime 
cd 		/tmp/HelloKRuntime 


touch project.json
echo "
 {
    \"dependencies\": 
	{
      \"System.Console\": \"4.0.0.0\"
    },
    \"configurations\": 
	{
      \"net45\": {},
      \"k10\": {}
    }
  }
" > project.json

echo "
using System;

  public class Program
  {
      public static void Main()
      {
          Console.WriteLine(\"Hello K Runtime !\");
      }
  }
 " > Project.cs
 
 kpm restore -s https://www.myget.org/F/aspnetvnext/
 
 export KRE_TRACE=1 
 k run
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 LD_LIBRARY_PATH=/usr/local/lib
 
 
 > I am using Mono 2.10.2, built from source on an Ubuntu server (since Ubuntu
> don't provide packages), and installed with prefix /opt/mono-2.10/.  I can
> see libMonoPosixHelper.so at /opt/mono-2.10/lib/libMonoPosixHelper.so.  I
> found a similar-looking bug in BugZilla
> (#202210<https://bugzilla.novell.com/show_bug.cgi?id=602210>),
> and one of the suggested workarounds there works for me - if I set
> LD_LIBRARY_PATH to /opt/mono-2.10/lib then everything starts working fine.
>   I get the feeling that is not a sensible long-term solution, but if that's
> the only option then I guess I'll take it.

This is already an extra-very-long-term solution, as it's almost
30 years old. It's how Unix deals with shared objects.

Instead of setting LD_LIBRARY_PATH you may want to add mono's lib
dir to /etc/ld.so.conf or /etc/ld.so.conf.d/mono or wherever
your system is configuring LD paths.

Alternatively, follow these docs:
http://www.mono-project.com/Parallel_Mono_Environments

 