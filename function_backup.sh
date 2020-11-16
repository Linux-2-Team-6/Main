#!/bin/bash

#***********************************#
# function_backup.sh                #
# author: michael                   #
# nov 12, 2020                      #
#                                   #
# backup logical flow               #
#***********************************#

# Import the CONFIG
source CONFIG

# source the functions needed
source function_getfiles.sh # function for getting the files to backup
source packncomp.sh # function for packing and compressing files and dirs
source unpack.sh # function for unpacking tar.gz files
source function_hashme.sh # function for hashing files
source function_encryption.sh # function for encrypting file
source SendSSH.sh # function for moving files to remote server
source function_writelog.sh # function for writing to the log

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# backup ()                                         #
# Parameter: nginx_config, nginx_data,              #
# mariadb_config, mariadb_data, sysconfig, home     #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function backup () {
 # get list of files to backup
 # pack file(s)
 # encrypt file
 # hash file
 # move file
 # hash again and compare to earlier hash
 # write success/fail to log

 # get the actual files to backup
 BACKUP_FILES=
 local GET_TARGET=$1
 if [[ "$GET_TARGET" == "full" ]] # get all the files
 then
  echo "Running full backup..."
  getfiles nginx_config nginx_data mariadb_config mariadb_data sysconfig home # get all the arrays
  #"${NGINX_CONFIG_FILES[@]}"
  #"${NGINX_DATA_FILES[@]}"
  #"${MARIADB_CONFIG_FILES[@]}"
  #"${MARIADB_DATA_FILES[@]}"
  #"${SYS_FILES[@]}"
  #"${HOME_FILES[@]}"
  BACKUP_FILES=("${NGINX_CONFIG_FILES[@]}" "${NGINX_DATA_FILES[@]}" "${MARIADB_CONFIG_FILES[@]}" "${MARIADB_DATA_FILES[@]}" "${SYS_FILES[@]}" "${HOME_FILES[@]}")
  #"${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "nginx_config" ]] # get nginx config files
 then
  echo "Running nginx config backup..."
  getfiles nginx_config # returns array NGINX_CONFIG_FILES
  #"${NGINX_CONFIG_FILES[@]}"
  BACKUP_FILES=("${NGINX_CONFIG_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "nginx_data" ]] # get nginx data files
 then
  echo "Running nginx data backup..."
  getfiles nginx_data # returns array NGINX_DATA_FILES
  #"${NGINX_DATA_FILES[@]}"
  BACKUP_FILES=("${NGINX_DATA_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "mariadb_config" ]] # get mariadb config files
 then
  echo "Running MariaDB config backup..."
  getfiles mariadb_config # returns array MARIADB_CONFIG_FILES
  #"${MARIADB_CONFIG_FILES[@]}"
  BACKUP_FILES=("${MARIADB_CONFIG_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "mariadb_data" ]] # get mariadb data files
 then
  echo "Running MariaDB data backup..."
  getfiles mariadb_data # returns array MARIADB_DATA_FILES
  #"${MARIADB_DATA_FILES[@]}"
  BACKUP_FILES=("${MARIADB_DATA_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "sysconfig" ]] # get sys config files
 then
  echo "Running system config backup..."
  getfiles sysconfig # returns array SYS_FILES
  #"${SYS_FILES[@]}"
  BACKUP_FILES=("${SYS_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 elif [[ "$GET_TARGET" == "home" ]] # get home dir
 then
  echo "Running home dir backup..."
  getfiles home # returns array HOME_FILES
  #"${HOME_FILES[@]}"
  BACKUP_FILES=("${HOME_FILES[@]}")
  #echo "${BACKUP_FILES[@]}"
 fi

 # pack files
 packnpress "${BACKUP_FILES[@]}"
 echo "Packing files as $PACK_FILENAME"
 #"$PACK_FILENAME"

 # encrypt packed files
 encrypt "$PACK_FILENAME"
 if [[ $ENCRYPT_STATUS -eq 0 ]]
 then
  echo "Encrypting file as $ENCRYPTED_FILENAME"
  echo "Removing unencrypted file $PACK_FILENAME"
 else
  echo "Encryption failed"
 fi
 #"$ENCRYPTED_FILENAME"

 # hash encrypted file and save result
 CHECKSUM=$(hashme "$ENCRYPTED_FILENAME")
 echo "Checksum: $CHECKSUM"

 # move file
 sendremote "$ENCRYPTED_FILENAME" "$REMOTE_SERVER" "$REMOTE_DIR"
 # $SEND_STATUS

 # hash file again and compare to old hash
 #res2=$(hashme XXX) # input the new path to file on remote server
 #if [[ "$res1" == "$res2" ]]
 #then
 #	echo "Checksum match"
 #else
 #	echo "Checksum missmatch"
 #fi

 # write success/fail and filename to log
 if [[ "$SEND_STATUS" -eq 0 ]]
 then 
  writelog 0 "$CHECKSUM"
  echo -e "Backup \e[92msuccessful\e[0m"
  echo
 else
  writelog 1 "$CHECKSUM"
  echo -e "Backup \e[91mfailed\e[0m"
  echo
 fi

 }