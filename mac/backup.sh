#!/bin/bash

export DESTINATION="/Volumes/Samsung\ USB/"

function backup_projects_downloads()
{
	mv /Projects/     "$DESTINATION"/
	mv ~/Downloads/   "$DESTINATION"/

	ls -al /Projects/
	ls -al ~/Downloads/
	ls -al "$DESTINATION"
}

#function backup_virtualization()
# {
#mv "~/VirtualBox\ VMs/"   $DESTINATION
#mv ~/Parallels/           $DESTINATION
# }

backup_projects_downloads
# backup_virtualization()
