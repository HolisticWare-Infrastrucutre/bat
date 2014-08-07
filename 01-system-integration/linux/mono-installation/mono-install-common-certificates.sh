#!/bin/bash


PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/

# -----------------------------------------------------------------------------------
# certificates for nuget

# http://stackoverflow.com/questions/15181888/nuget-on-linux-error-getting-response-stream


#..........................................................
# user store import (default)
mozroots --import --sync
yes | certmgr -ssl https://go.microsoft.com
yes | certmgr -ssl https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl https://nuget.org
yes | certmgr -ssl https://www.myget.org/F/aspnetvnext/
#..........................................................

#..........................................................
# machine store import
# solves some problems -  TO test
mozroots --import --machine --sync
yes | certmgr -ssl -m https://go.microsoft.com
yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl -m https://nuget.org
yes | certmgr -ssl -m https://www.myget.org/F/aspnetvnext/
#..........................................................


#-------------------------------------------------------------------------------------------
# old 	mozroots --import --sync
# old 	yes | certmgr -ssl https://go.microsoft.com
# old 	yes | certmgr -ssl https://nugetgallery.blob.core.windows.net
# old 	yes | certmgr -ssl https://nuget.org
# old 	yes | certmgr -ssl https://www.myget.org/F/aspnetvnext/
# old 	
# old 	# Now it works for me:
# old 	cd main/src/addins/AspNet
# old 	mono ../../../external/nuget-binary/NuGet.exe restore
# old 	-SolutionDirectory ../../..
# old 	
# old 	certmgr -ssl -m https://go.microsoft.com
# old 	certmgr -ssl -m https://nugetgallery.blob.core.windows.net
# old 	certmgr -ssl -m https://nuget.org
# old 	certmgr -ssl -m https://www.myget.org/F/aspnetvnext/
# old 	mozroots --import --sync
# -----------------------------------------------------------------------------------
