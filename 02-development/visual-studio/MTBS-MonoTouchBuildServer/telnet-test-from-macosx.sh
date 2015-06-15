#!/bin/bash

# http://www.g-loaded.eu/2006/11/06/netcat-a-couple-of-useful-examples/

# telnet 127.0.0.1 5000
# enter 
# helo

# telnet localhost 5000

# Netcat
#	linux/mac	nc
#	windows		ncat.exe		(comes with nmap)
echo helo  | nc 127.0.0.1 5000

# output:
#
# MTBSERVERPORTS:49882;49884
# 
# Unhandled Exception:
# System.ObjectDisposedException: The object was used after being disposed.
#   at System.Threading.WaitHandle.CheckDisposed () [0x00000] in <filename unknown>:0 
#   at System.Threading.EventWaitHandle.Set () [0x00000] in <filename unknown>:0 
#   at (wrapper remoting-invoke-with-check) System.Threading.EventWaitHandle:Set ()
#   at Mtb.Server.Tail.Run () [0x00000] in <filename unknown>:0 
#   at System.Threading.Thread.StartInternal () [0x00000] in <filename unknown>:0 
# [ERROR] FATAL UNHANDLED EXCEPTION: System.ObjectDisposedException: The object was used after being disposed.
#   at System.Threading.WaitHandle.CheckDisposed () [0x00000] in <filename unknown>:0 
#   at System.Threading.EventWaitHandle.Set () [0x00000] in <filename unknown>:0 
#   at (wrapper remoting-invoke-with-check) System.Threading.EventWaitHandle:Set ()
#   at Mtb.Server.Tail.Run () [0x00000] in <filename unknown>:0 
#   at System.Threading.Thread.StartInternal () [0x00000] in <filename unknown>:0 

