#!/bin/sh
export MONO_TLS_PROVIDER=btls
export MONO_IOMAP=all
exec mono /usr/local/lib/nuget/nuget.exe "$@"