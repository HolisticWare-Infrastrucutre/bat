#!/bin/bash

# http://richddean.com/post/147155656349/stopautostartglobalprotectvpn

ls /Library/LaunchAgents
mkdir ~/bat/mac/paloalto.GlobalProtectVPN
cp /Library/LaunchAgents/com.paloaltonetworks.gp.*.plist ~/bat/mac/paloalto.GlobalProtectVPN/
sudo code -n --user-data-dir="~/.vscode-root" /Library/LaunchAgents/com.paloaltonetworks.gp.*.plist
 