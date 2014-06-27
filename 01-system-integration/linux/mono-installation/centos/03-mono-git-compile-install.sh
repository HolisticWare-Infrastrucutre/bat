#!/bin/bash

# -----------------------------------------------------------------------------------
# CentOS 
#		6.5
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# prerequisites for mono compilation from git (after clean install)
./01-mono-git-compile-install-prerequisites.sh
# -----------------------------------------------------------------------------------


	
	
../mono-git-compile-install-common.sh



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
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

 