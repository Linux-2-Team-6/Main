#!/bin/bash

function fetchremote() {


local FILE=$1			# filnamn
local REM_SER=$2		# Peter@centos
local REM_DIR=$3		# /home/peter/Junk

LOCAL_DIR=/home/$USER/Backup/
FETCH_SUCESS=0
SEND_FAIL=1


if [[ ! -d "$LOCAL_DIR" ]]; then
	mkdir "$LOCAL_DIR"

	if [[ 'ssh "$REM_SER" test -d "$REM_DIR" && test -e "$FILE"' ]]; then
		rsync -a "$REM_SER":"$REM_DIR"/"$FILE" "$LOCAL_DIR"
		
		if [ $? -eq 0 ]; then 		# if send was succesfull
			echo "Transfer successful"
			FETCH_STATUS=$FETCH_SUCESS
		else 					# if fetch failed
			echo "Something went wrong in fetching the file from the remote server $REM_SER."
			SEND_STATUS=$FETCH_FAIL
		fi
	fi

fi


}

# test / debug
#fetchremote "$1" "$2" "$3"