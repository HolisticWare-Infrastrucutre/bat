#!/bin/bash

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

mozroots --import --sync
yes | certmgr -ssl https://go.microsoft.com
yes | certmgr -ssl https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl https://nuget.org
yes | certmgr -ssl https://www.myget.org/F/aspnetvnext/

# Now it works for me:
cd main/src/addins/AspNet
mono ../../../external/nuget-binary/NuGet.exe restore
-SolutionDirectory ../../..

certmgr -ssl -m https://go.microsoft.com
certmgr -ssl -m https://nugetgallery.blob.core.windows.net
certmgr -ssl -m https://nuget.org
certmgr -ssl -m https://www.myget.org/F/aspnetvnext/
mozroots --import --sync
# -----------------------------------------------------------------------------------
