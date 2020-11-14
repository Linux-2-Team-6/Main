#!/bin/bash

# In this script we will choose a file and send it to the desired location.
# 2 arguments: 1(Sourcefile: 2(Targetlocation


# Declare error code
K_FILENOTFOUND=1

function sendshit () {
	SOURCEFILE=$1 # Name of the file
	TARGETLOCATION=$2 # The target location
	
	if [[ ! -f "$SOURCEFILE" ]] # Here we check for the accepted format of the file.
	then
		echo "The chosen target does not exist"
	exit
	fi

	if [[ ! -d "$TARGETLOCATION" ]] # Here we check if the desired location exists.
	then
		echo "The chosen location does not exist"
		exit
	fi	

	if [[ -f "$SOURCEFILE" && -d "$TARGETLOCATION" ]] 
	then
		mv "$SOURCEFILE" "$TARGETLOCATION" # Here we move the chosen file to the desired dir.
		echo "Moving file.."
	
		if [[ "$?" -eq 0 ]]
		then
			echo "Succesfully moved!"
		exit
	fi
	else
			echo "An error occured"
fi
}

#echo "$SOURCEFILE" "$TARGETLOCATION"

sendshit "$1" "$2"
