#!/bin/bash

packnpress () {

	THETARGET="$@" # The chosen files

	if [[ ! -f "$THETARGET" ]]
	then
		echo "Can't find it"
		exit

	fi

	for files in $THETARGET
	do
		tar --backup -cvzf backups.tar.gz "$THETARGET"
	done





}

packnpress "$@"
