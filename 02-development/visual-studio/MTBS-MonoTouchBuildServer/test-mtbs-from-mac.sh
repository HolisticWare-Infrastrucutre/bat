#!/bin/bash

# check if Xamarin.iOS Build Host app is running
ps -x | grep Xamarin\.iOS | grep Applications
# output:
# 2627 ?? 0:02.17 /Applications/Xamarin.iOS Build Host.app/Contents/MacOS/Xamarin.iOS Build Host

# Make sure that the OS sees that the Xamarin.iOS Build Host app is running

ps -x | grep Xamarin\.iOS | grep Applications
# 2627 ?? 0:02.17 /Applications/Xamarin.iOS Build Host.app/Contents/MacOS/Xamarin.iOS Build Host


# rerun the launchctl command to unload + reload the launch daemon, just to be thorough
launchctl unload -w /Library/LaunchAgents/com.xamarin.mtvs.buildserver.plist
lsof -i -P | grep -i listen
launchctl load -w -F /Library/LaunchAgents/com.xamarin.mtvs.buildserver.plist

lsof -i -P | grep -i listen
# launchd 164 username 41u IPv4 0x85c33c8d4763c13f 0t0 TCP *:5000 (LISTEN)
# launchd 164 username 43u IPv6 0x85c33c8d4446ca5f 0t0 TCP *:5000 (LISTEN)

launchctl list | grep xamarin
# -	0	com.xamarin.mtvs.buildserver
# 98586	-	com.xamarin.mtvs.buildservergui.199440