#!/bin/bash

# -----------------------------------------------------------------------------------
# OpenSUSE 13.1
# -----------------------------------------------------------------------------------

systemctl status sshd.service
systemctl start sshd.service




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

# Run the following line after ./autogen.sh
make get-monolite-latest

# This will download and automatically gunzip and untar the tarball, and place 
# the files appropriately so that you can then just run: 



PREFIX=/usr/local
./autogen.sh --prefix=$PREFIX
make get-monolite-latest

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib/
make check

sudo make install
mono -V
# -----------------------------------------------------------------------------------





 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
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

 