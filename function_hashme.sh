#!/bin/bash

#***********************************#
# function_hashme.sh                #
# author: michael                   #
# oct 29, 2020                      #
#                                   #
# Hash files for integrity check    #
#***********************************#

# Declare return codes
HASH_SUCCESS=0
HASH_FAIL=1

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# hash_me ()                                        #
# Parameter: target file name                       #
# returns 0 on success, 1 if file doesn't exists    #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function hashme () {
 local FILENAME="$1" # Pass argument 1 to FILENAME
 if [[ -f "$FILENAME" ]] # Check if file exists, return file hash and success
 then
  file_hash=$(sha256sum "$FILENAME")
  echo "$file_hash"
  HASH_STATUS=$HASH_SUCCESS
 else # if file doesn't exist, return fail
  HASH_STATUS=$HASH_FAIL
 fi
}

# debug / test - send $file to hashme ()
#hashme $1