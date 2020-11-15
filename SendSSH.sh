#!/bin/bash

function sendremote(){


local FILE=$1			# filnamn
local REM_SER=$2		# Peter@centos
local REM_DIR=$3		# /home/peter/Junk

SEND_SUCESS=0
SEND_FAIL=1

if ssh "$REM_SER" [ -d "REM_DIR" ]; then
	rsync --remove-source-files "$FILE" "$REM_SER":"$REM_DIR"
	if [ $? -eq 0 ]; then 		# if send was succesfull
		echo "Transfer successful"
		SEND_STATUS=$SEND_SUCESS
	else 					# if send failed
		echo "Something went wrong in sending the file to remote server $REM_SER."
		SEND_STATUS=$SEND_FAIL
	fi
else 
	ssh -t "$REM_SER" mkdir -p "$REM_DIR"
	if [ $? -eq 0 ] 		# if mkdir was successful
	then
		rsync --remove-source-files "$FILE" "$REM_SER":"$REM_DIR"
		if [ $? -eq 0 ] # if send was succesfull
		then
			echo "Transfer successful"
			SEND_STATUS=$SEND_SUCESS
		else 			# if send failed
			echo "Something went wrong in sending the file to remote server $REM_SER."
			SEND_STATUS=$SEND_FAIL
		fi
	else 				# if mkdir failed
		echo "Unable to create $REM_DIR on $REM_SER"
		SEND_STATUS=$SEND_FAIL
	fi
fi


}

# test / debug
sendremote
