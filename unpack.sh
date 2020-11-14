#!/bin/bash

unpack-unpress () {

	THETARFILE=$1 # The chosen files

	if [[ ! -f "$THETARFILE" ]]	
	then
		echo "Not a valid source"
		exit
	fi

#echo $THETARFILE	

		if [[ -f "$THETARFILE" ]]
		then
			tar -xvzf "$THETARFILE"

			echo "Succesfully Unpacked!"	
		else
			echo "An error occured"
		fi
	}

unpack-unpress $1
