#!/bin/bash

cat /proc/filesystems

ls /lib/modules/$(uname -r)/kernel/fs/*/*ko

ls /lib/modules/$(uname -r)/kernel/fs