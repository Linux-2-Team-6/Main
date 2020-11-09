#!/bin/bash

#***********************************#
# main.sh                           #
# author: Michael                   #
# Nov 7, 2020                       #
#                                   #
# Main script v0.1                  #
#***********************************#

source function_hashme.sh
source function_writelog.sh
# source pack
# source unpack
# source move
# source encrypt
# source schedule

function menu () {
 # placeholder
 echo "...Menu not found..."
}

function backup () { # placeholder
 # pack file(s)
 # hash file
 # move file
 # hash again and compare to earlier hash
 # write success/fail to log

 # testing write to log
 write_log 1 backup-test.tar.gz

 }

if [[ $# -gt 1 ]] # Check if there is more than 1 parameter
then
 echo "Invalid number of parameters. Only one is accepted."
 echo "Type --help for more information."
 exit 0
fi

PARAM=$1 # Set parameter 1 to variable

if [[ $PARAM == "-h" ]] || [[ $PARAM == "--help" ]] # Display help text
then
 echo "Usage: main.sh [OPTION]"
 echo
 echo -e '-h, --help\tDisplays this help and exit'
 echo -e "-f, --full\tRuns a full (system config files, web and db, home dir)\n\t\tbackup on your system"
 echo -e "-m, --man\tRun manual backups on desired files and applications"
 echo
elif [[ $PARAM == "-f" ]] || [[ $PARAM == "--full" ]] # Run full backup (used for scheduling)
then
 echo "Running full backup..."
 backup
 if [[ $LOG_STATUS -eq 0 ]] # Check if function backup returned success
 then
  echo "Backup successful"
 elif [[ $LOG_STATUS -eq 1 ]] # or fail
 then
  echo "Backup failed"
 else # or unknown error
  echo "Backup ERROR"
 fi
elif [[ $PARAM == "-m" ]] || [[ $PARAM == "--man" ]] || [[ $PARAM == "" ]] # Load the user config menu (used for partial/manual backups)
then
 echo "Loading user menu..."
 menu # replace with Rickards menu
fi



