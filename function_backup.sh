#!/bin/bash

#***********************************#
# function_backup.sh                #
# author: michael                   #
# nov 12, 2020                      #
#                                   #
# backup logical flow               #
#***********************************#

# source the functions needed
source function_getfiles.sh
# source pack
# source unpack
source function_hashme.sh
# source move
source function_encryption.sh
source function_writelog.sh

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

 # testing getfiles
 #+ send these to pack next
 local GET_TARGET=$1
 if [[ "$GET_TARGET" == "full" ]] # get all the files
 then
  getfiles nginx_config nginx_data mariadb_config mariadb_data sysconfig home # get all the arrays
  echo "${NGINX_CONFIG_FILES[@]}"
  echo "${NGINX_DATA_FILES[@]}"
  echo "${MARIADB_CONFIG_FILES[@]}"
  echo "${MARIADB_DATA_FILES[@]}"
  echo "${SYS_FILES[@]}"
  echo "${HOME_FILES[@]}"
 elif [[ "$GET_TARGET" == "nginx_config" ]] # get nginx config files
 then
  getfiles nginx_config # returns array NGINX_CONFIG_FILES
  echo "${NGINX_CONFIG_FILES[@]}"
 elif [[ "$GET_TARGET" == "nginx_data" ]] # get nginx data files
 then
  getfiles nginx_data # returns array NGINX_DATA_FILES
  echo "${NGINX_DATA_FILES[@]}"
 elif [[ "$GET_TARGET" == "mariadb_config" ]] # get mariadb config files
 then
  getfiles mariadb_config # returns array MARIADB_CONFIG_FILES
  echo "${MARIADB_CONFIG_FILES[@]}"
 elif [[ "$GET_TARGET" == "mariadb_data" ]] # get mariadb data files
 then
  getfiles mariadb_data # returns array MARIADB_DATA_FILES
  echo "${MARIADB_DATA_FILES[@]}"
 elif [[ "$GET_TARGET" == "sysconfig" ]] # get sys config files
 then
  getfiles sysconfig # returns array SYS_FILES
  echo "${SYS_FILES[@]}"
 elif [[ "$GET_TARGET" == "home" ]] # get home dir
 then
  getfiles home # returns array HOME_FILES
  echo "${HOME_FILES[@]}"
 fi
 # WORKS -------------

 # testing pack

 # testing hash
 res1=$(hashme backups.log)
 res2=$(hashme backups.log)
 if [[ "$res1" == "$res2" ]]
 then
 	echo "Checksum match"
 	#echo "$res1 is equal to $res2"
 else
 	echo "Checksum missmatch"
 fi
 # WORKS -------------

 # testing move

 # testing encryption
 #encrypt derp
 #decrypt derp.gpg
 # WORKS -------------

 # testing write to log
 writelog 0 backup-test.tar.gz
 # WORKS -------------

 }