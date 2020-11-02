#!/bin/bash

#***********************************#
# function_hashme.sh		 		#
# author: michael					#
# oct 29, 2020						#
#									#
# Hash files for integrity check	#
#***********************************#

# Declare error codes
E_FILENOTFOUND=1

# Declare file to hash, used for testing purposes
#+ this will later be passed to the function by the backup script
file='one.log'

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# hash_me ()										#
# Parameter: target	file name						#
# returns 0 on success, 1 if file doesn't exists 	#
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function hashme () {
	FILENAME=$1 # Pass argument 1 to FILENAME
	if [ -f $FILENAME ] # Check if file exists
	then
		file_hash=$(sha256sum $FILENAME)
		echo $file_hash
		return 0 # success
	else # if file doesn't exist, return error 1
		return $E_FILENOTFOUND
	fi
}

# debug / test - send $file to hashme ()
hashme $file