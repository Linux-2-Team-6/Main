#!/bin/bash

# 2 arguments: 1(Sourcefile: 2(Targetlocation


# Declare error code
K_FILENOTFOUND=1

function sendshit () {
	SOURCEFILE=$1 # Name of the file
	TARGETLOCATION=$2 # The target location
	
	if [[ ! -f "$SOURCEFILE" ]]
	then
		echo "File does not exist"
		exit
	fi

	if [[ ! -d "$TARGETLOCATION" ]]
	then
		echo "Location does not exist"
		exit
	fi	

	if [[ -f "$SOURCEFILE" && -d "$TARGETLOCATION" ]] 
	then
		mv "$SOURCEFILE" "$TARGETLOCATION"
		echo "Moving file.."
	
		if [[ "$?" -eq 0 ]]
		then
			echo "Succesfully moved!"
		elif [[ "$?" -eq 1 ]]
		then
			echo "Error, check your shit"
		else
			echo "Something is wrong"	
	fi
fi
}

echo "$SOURCEFILE" "$TARGETLOCATION"

sendshit "$1" "$2"
