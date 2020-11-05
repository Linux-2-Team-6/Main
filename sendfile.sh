#!/bin/bash

# 2 arguments: 1(Sourcefile: 2(Targetlocation


function sendshit () {
	SOURCEFILE=$1 # Name of the file
	TARGETLOCATION=$2 # The target location

	if [[ $SOURCEFILE -f ]] && [[ $TARGETLOCATION -f ]]  
	then
		mv [[$SOURCEFILE]] [[$TARGERLOCATION]]
		echo "Succesfully moved!"

	else
		echo "Error, check your shit"	

	fi

}
