#!/bin/bash

#=========================================================================================
# http://carolynvanslyck.com/blog/2014/09/dotnet-vnext-impressions/
# 
#=========================================================================================


# At the time of writing there is an open issue with running Kestrel on Linux. 
# To work around it is compile Kestrel (v0.11.29), and copy the resulting 
#		libuv.so.11 to 		
# MacOSX
# 	~/.kpm/packages/Microsoft.AspNet.Server.Kestrel/1.0.0-alpha3/native/darwin/universal/libuv.dylib.
# Linux
# 


cd /tmp
git clone https://github.com/moljac/KestrelHttpServer.git kestrel-cloned
cd kestrel-cloned/
chmod 700 ./build.sh
./build.sh

# certificates
# WARNING: Error: SendFailure (Error writing headers)
# WARNING: Error: SendFailure (Error writing headers)
# Unable to find version '0.2' of package 'Sake'.
