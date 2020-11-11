#!/bin/bash

#***********************************#
# main.sh                           #
# author: Michael                   #
# Nov 7, 2020                       #
#                                   #
# Main script v0.1                  #
#***********************************#

# source menu
source function_getfiles.sh
# source pack
# source unpack
source function_hashme.sh
# source move
source function_encryption.sh
source function_writelog.sh
# source schedule

function menu () {
 # placeholder
 echo "...Menu not found..."
}

function backup () { # placeholder
 # get list of files to backup
 # pack file(s)
 # hash file
 # move file
 # hash again and compare to earlier hash
 # encrypt file
 # write success/fail to log

 # testing getfiles
 #+ send these to pack next
 local GET_TARGET=$1
 if [[ "$GET_TARGET" == "full" ]] # get all the files
 then
  getfiles nginx home sysconfig mariadb # return arrays NGINX_FILES, HOME_FILES, SYS_FILES, MARIADB_FILES
  echo "${NGINX_FILES[@]}"
  echo "${MARIADB_FILES[@]}"
  echo "${SYS_FILES[@]}"
  echo "${HOME_FILES[@]}"
 elif [[ "$GET_TARGET" == "nginx" ]] # get nginx files
 then
  getfiles nginx # returns array NGINX_FILES
  echo "${NGINX_FILES[@]}"
 elif [[ "$GET_TARGET" == "mariadb" ]] # get mariadb files
 then
  getfiles mariadb # returns array MARIADB_FILES
  echo "${MARIADB_FILES[@]}"
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

if [[ $# -gt 1 ]] # Check if there is more than 1 parameter
then
 echo "Invalid number of parameters. Only one is accepted."
 echo "Type --help for more information."
 exit 0
fi

PARAM=$1 # Set parameter 1 to variable

if [[ "$PARAM" == "-h" ]] || [[ "$PARAM" == "--help" ]] # Display help text
then
 echo "Usage: main.sh [OPTION]"
 echo
 echo -e '-h, --help\tDisplays this help and exit'
 echo -e "-f, --full\tRuns a full (system config files, web and db, home dir)\n\t\tbackup on your system"
 echo -e "-m, --man\tRun manual backups on desired files and applications"
 echo
elif [[ "$PARAM" == "-f" ]] || [[ "$PARAM" == "--full" ]] # Run full backup (used for scheduling)
then
 echo "Running full backup..."
 backup full
 if [[ "$LOG_STATUS" -eq 0 ]] # Check if function backup returned success
 then
  echo "Backup successful"
 elif [[ "$LOG_STATUS" -eq 1 ]] # or fail
 then
  echo "Backup failed"
 else # or unknown error
  echo "Backup ERROR"
 fi
elif [[ "$PARAM" == "-m" ]] || [[ "$PARAM" == "--man" ]] || [[ "$PARAM" == "" ]] # Load the user config menu (used for partial/manual backups)
then
 echo "Loading user menu..."
 menu # replace with Rickards menu
fi



