# Scripts for Metal


## Optimizations

*   Windows

    *   https://github.com/topics/registry-cleaner?l=c%23

        *   Windows

            *   https://github.com/little-apps/LittleRegistryCleaner

            *   https://github.com/little-apps/little-system-cleaner

            https://www.atera.com/shared-script-library/c-drive-clean-up/
            https://www.geeksforgeeks.org/disk-cleanup-using-powershell-scripts/



https://github.com/mac-cleanup/mac-cleanup-sh/blob/main/mac-cleanup

https://github.com/mac-cleanup/mac-cleanup-py

https://www.hexnode.com/mobile-device-management/help/script-to-clear-cache-on-macos-devices/

https://unix.stackexchange.com/questions/494910/cleanup-script-for-macos

https://discussions.apple.com/thread/8389927

brew update && brew upgrade && brew cleanup && brew doctor

sudo periodic daily weekly monthly all

https://github.com/loopnlearn/loopbuildscripts/blob/main/XcodeClean.sh

https://waxzce.medium.com/keeping-macos-clean-this-is-my-osx-brew-update-cli-command-6c8f12dc1731

https://waxzce.medium.com/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff

https://cpojer.net/posts/set-up-a-new-mac-fast


/tmp/dotnet-installer
/tmp/NuGetScratch

remove all the merged branches from a single project with this command:

git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
WOW, what a mouthful for only one project! Let’s make it worse. ?

This code will CD into all folders in the current working directory, and then run the command to clean merged branches for each!

for d in */; do cd $d; echo WORKING ON $d; git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d; cd ..; done


Removes all node_modules folders older than 4 months:

find . -name "node_modules" -type d -mtime +120 | xargs rm -rf
If you’re feeling quite aggressive, you can just clear out ALL node_modules folders and re-install as needed, by removing the mtime flag.

Removes all node_modules folders:

find . -name "node_modules" -type d | xargs rm -rf

https://www.freecodecamp.org/news/how-to-free-up-space-on-your-developer-mac-f542f66ddfb/



        Steps to Clean up a Mac
Clean up caches and logs. ...
Delete installation files. ...
Remove email attachments. ...
Remove old large files from Mac. ...
Uninstall unused applications. ...
Remove duplicate files. ...
Remove old iOS backups. ...
Clean up the desktop.


Here is the list of quick tips on what you should remove from your Mac to free up space on your disk.
Clean up caches and logs
Delete installation files (DMG files)
Remove email attachments
Remove large, unused files
Uninstall unused applications
Remove duplicate files
Remove old iOS backups
Clean up the desktop
Empty the Trash


~/Library/Caches 
Please note that it is better to remove cache files in each folder rather than the cache folders themselves, in order to avoid any errors. You have to go to the folders one by one and remove caches of the appropriate applications. Also, you must be very careful not to remove system cache folders (those which have the com.apple words in the names.)

Here is list of the most common system file storages:

~/Library/Application Support
~/Library/Caches
~/Library/Logs
~/Library/Preferences
~/Library/Containers
~/Library/Cookies



## Visual Studio

https://learn.microsoft.com/en-us/visualstudio/mac/uninstall?view=vsmac-2022#uninstall-scripts


sudo rm -rf "/Applications/Visual Studio.app"
rm -rf ~/Library/Caches/VisualStudio
rm -rf ~/Library/Preferences/VisualStudio
rm -rf ~/Library/Preferences/Visual\ Studio
rm -rf ~/Library/Logs/VisualStudio
rm -rf ~/Library/VisualStudio
rm -rf ~/Library/Preferences/Xamarin/
rm -rf ~/Library/Application\ Support/VisualStudio

rm -rf ~/Library/Developer/Xamarin
sudo rm -rf /Library/Frameworks/Mono.framework
sudo pkgutil --forget com.xamarin.mono-MDK.pkg
sudo rm -rf /etc/paths.d/mono-commands
