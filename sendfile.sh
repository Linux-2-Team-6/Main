#!/bin/bash

# 2 arguments: 1(Sourcefile: 2(Targetlocation


function sendshit () {
	SOURCEFILE=$1 # Name of the file
	TARGETLOCATION=$2 # The target location

	if [[ -f "$SOURCEFILE" ]] && [[ -f "$TARGETLOCATION" ]]  
	then
		mv "$SOURCEFILE" "$TARGETLOCATION"
		echo "Succesfully moved!"

	else
		echo "Error, check your shit"	

	fi

}
