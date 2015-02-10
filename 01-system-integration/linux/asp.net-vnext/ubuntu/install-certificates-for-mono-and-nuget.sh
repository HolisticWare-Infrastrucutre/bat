#!/bin/bash

CERTMGR=/usr/bin/certmgr
$CERTMGR -ssl -m https://nugetgallery.blob.core.windows.net
$CERTMGR -ssl -m https://go.microsoft.com
$CERTMGR -ssl -m https://nuget.org
$CERTMGR -ssl -m https://www.myget.org/F/aspnetvnext/

mozroots --import --sync