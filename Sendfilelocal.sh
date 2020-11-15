#!/bin/bash

# Function for sending a specific file to a directory.


function Sendfile(){

SOURCEFILE=$1	# Name of the sourcefile
DEST_DIR=$2		# The wanted target location



if [[ -e "$SOURCEFILE" && -d "$DEST_DIR" ]]; then					# If file and directory exists
	mv "$SOURCEFILE" "$DEST_DIR" && echo "$1 moved to $2"				#+Move it and announce it.

elif [[ ! -e "$SOURCEFILE" ]]; then										# Test if file exist					
	echo "File does not exist"

elif [[ ! -d "$DEST_DIR" ]]; then										# Test if directory exist
	echo "Directory does not exist"
	

elif [[ "$? == 1" ]]; then
	echo "Error, could not move $1 to $2"								# If there are any other errors

fi


}



Sendfile

exit
