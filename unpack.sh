#!/bin/bash

# This script will unpack and uncompress your zipfile.

source fetchfile.sh

unpack-unpress () {

	THETARFILE="$1" # The chosen files
	#echo "$THETARFILE"
	if [[ ! -f "$THETARFILE" ]] # Checks if the file is an acceptable format.
	then
		echo -e "$THETARFILE - \e[91mNot a valid source\e[0m"	
	else
		tar -xvzf "$THETARFILE" -C "$LOCAL_DIR" # Here we the unpacking and uncompressing
		echo -e "\e[92mSuccessfully\e[0m unpacked!"	
	fi
}
