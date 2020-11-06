#!/bin/bash

# 2 arguments: 1(Sourcefile: 2(Targetlocation


# Declare error code
K_FILENOTFOUND=1

function sendshit () {
	SOURCEFILE=$1 # Name of the file
	TARGETLOCATION=$2 # The target location

	if [[ -e "$SOURCEFILE" ]] && [[ -d "$TARGETLOCATION" ]] 

		mv "$SOURCEFILE" "$TARGETLOCATION"
	then
		echo "Succesfully moved!"

	else
		echo "Error, check your shit"	
		return $K_FILENOTFOUND
	fi

}

echo "$SOURCEFILE" "$TARGETLOCATION"

sendshit "$1" "$2"
