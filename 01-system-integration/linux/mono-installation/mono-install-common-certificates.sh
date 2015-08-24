#!/bin/bash

# -----------------------------------------------------------------------------------
# certificates for nuget

# http://monomvc.wordpress.com/2012/03/06/nuget-on-mono/
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
