#!/bin/bash

source function_filename.sh

# This script will take your files and pack them into a zipfile, after that it will also compress the zipfile.

packnpress () {

	local THETARGET+=($@) # The chosen files
	local PACK_SUCCESS=0
	local PACK_FAIL=1
	
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
	
	#echo "${THETARGET[@]}" This is only for testing purposes.

	# get a unique filename
	filename
	PACK_FILENAME=$BACKUP_FILENAME

	if [[ $PACK_STATUS -eq "0" ]]
	then	
		tar --backup --absolute-names -czf "$PACK_FILENAME" "${THETARGET[@]}" # Here we create the zip and compress it.
		if [ $? -eq 0 ] # if pack was succesfull
		then
			PACK_STATUS=$PACK_SUCESS
		else 			# if pack failed
			PACK_STATUS=$PACK_FAIL
		fi
	fi
}