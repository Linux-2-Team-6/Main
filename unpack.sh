#!/bin/bash

# This script will unpack and uncompress your zipfile.

unpack-unpress () {

	THETARFILE=$1 # The chosen files

	if [[ ! -f "$THETARFILE" ]] # Checks if the file is an acceptable format.
	then
		echo "Not a valid source"
		exit
	fi

#echo $THETARFILE	

		if [[ -f "$THETARFILE" ]]
		then
			tar -xvzf "$THETARFILE" # Here we the unpacking and uncompressing

			echo "Succesfully Unpacked!"	
		else
			echo "An error occured"
		fi
	}

unpack-unpress $1
