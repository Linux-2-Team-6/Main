#!/bin/bash

#***********************************#
# function_restore.sh               #
# author: michael                   #
# nov 17, 2020                      #
#                                   #
# restoe logical flow               #
#***********************************#

# Import the CONFIG
source CONFIG

# source the functions needed
source unpack.sh # function for unpacking tar.gz files
source function_hashme.sh # function for hashing files
source function_encryption.sh # function for encrypting file
source fetchfile.sh # function for fetching files from remote server
source function_writelog.sh # function for writing to the log

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# backup ()                                         #
# Parameter: nginx_config, nginx_data,              #
# mariadb_config, mariadb_data, sysconfig, home     #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function restore () {
 # get list of files to backup
 # pack file(s)
 # encrypt file
 # hash file
 # move file
 # hash again and compare to earlier hash
 # write success/fail to log

 # get the actual file to restore
 # ssh ls -la
 ssh "$REMOTE_SERVER" ls -l "$REMOTE_DIR"
 echo "Which file do you want to restore?"
 read "RESTORE_FILENAME"
 fetchremote "$RESTORE_FILENAME" "$REMOTE_SERVER" "$REMOTE_DIR"
 NEWPATH="$LOCAL_DIR$RESTORE_FILENAME"

 # hash encrypted file and save result
 RESTORE_CHECKSUM=$(hashme "$NEWPATH")
 echo "Checksum: $RESTORE_CHECKSUM"

 # decrypt packed files
 decrypt "$NEWPATH"
 if [[ $DECRYPT_STATUS -eq 0 ]]
 then
  echo "Decrypting file as ${NEWFILENAME[0]}.${NEWFILENAME[1]}.${NEWFILENAME[2]}"
 else
  echo "Decryption failed"
 fi

 NEWPATH="${NEWFILENAME[0]}.${NEWFILENAME[1]}.${NEWFILENAME[2]}"
 # unpack files
 unpack-unpress "$NEWPATH"
 
 echo

 }

#restore