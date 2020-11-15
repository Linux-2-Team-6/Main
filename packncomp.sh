#!/bin/bash

# This script will take your files and pack them into a zipfile, after that it will also compress the zipfile.

packnpress () {

	THETARGET+=($@) # The chosen files
	PACK_SUCCESS=0
	PACK_FAIL=1
	
	for file in "${THETARGET[@]}"
	do
	if [[ ! -f "$file" ]] && [[ ! -d "$file" ]] # This part checks if it is the correct file format.	
	then	
		echo "$file is not a valid source"
		PACK_STATUS=$PACK_FAIL	
	else 
	 PACK_STATUS=$PACK_SUCCESS

	fi
	done
	
echo "${THETARGET[@]}" This is only for testing purposes.

	if [[ $PACK_STATUS -eq "0" ]]
	then	
		tar --backup -cvzf backups.tar.gz "${THETARGET[@]}" # Here we create the zip and compress it.
	fi
}

packnpress $@
