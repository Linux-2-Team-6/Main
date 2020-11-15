#!/bin/bash

# This script will take your files and pack them into a zipfile, after that it will also compress the zipfile.

packnpress () {

	THETARGET+=($@) # The chosen files
	X_SUCCESS=0
	X_FAIL=1

	for file in "${THETARGET[@]}"
	do
	if [[ ! -f "$file" ]] && [[ ! -d "$file" ]] # This part checks if it is the correct file format.	
	then	
		echo "Not a valid source"
		exit
	

#echo $@ This is only for testing purposes.

		else
		tar --backup -cvzf backups.tar.gz "$file" # Here we create the zip and compress it.
	fi	
	done
}

packnpress $@
