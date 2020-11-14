#!/bin/bash

# This script will take your files and pack them into a zipfile, after that it will also compress the zipfile.

packnpress () {

	THETARGET+=($@) # The chosen files

	if [[ ! -f "$THETARGET" ]] && [[ ! -d "$THETARGET" ]] # This part checks if it is the correct file format.	
	then
		echo "Not a valid source"
		exit
	fi
#	echo $@ This is only for testing purposes.

		tar --backup -cvzf backups.tar.gz "$@" # Here we create the zip and compress it.

}

packnpress $@
