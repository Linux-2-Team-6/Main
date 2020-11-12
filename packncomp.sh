#!/bin/bash

packnpress () {

	THETARGET+=($@) # The chosen files

	if [[ ! -f "$THETARGET" ]] && [[ ! -d "$THETARGET" ]]	
	then
		echo "Not a valid source"
		exit
	fi
	echo $@	

		tar --backup -cvzf backups.tar.gz "$@"

}

packnpress $@
