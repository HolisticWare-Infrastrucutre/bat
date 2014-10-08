#!/bin/bash

# -----------------------------------------------------------------------------------
# ASP.net vNext


mono-install-common-certificates.sh



# -----------------------------------------------------------------------------------
# kvmsetup script
curl \
	https://raw.githubusercontent.com/graemechristie/Home/KvmShellImplementation/kvmsetup.sh | sh \
	&& \
	source ~/.kre/kvm/kvm.sh \
	&& \
	kvm upgrade
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
# getting started

cd /tmp
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