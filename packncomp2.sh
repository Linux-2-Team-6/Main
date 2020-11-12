#!/bin/bash

packnpress () {

	THETARGET=($1) # The chosen files

	if [[ ! -f "$THETARGET" ]] && [[ ! -d "$THETARGET" ]]	
	then
		echo "Not a valid source"
		exit
	fi
		
	for i in $THETARGET
	do
		tar --backup -cvzf backups.tar.gz "$i"
	
	done





}

packnpress $1
