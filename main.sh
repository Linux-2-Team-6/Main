#!/bin/bash

#***********************************#
# main.sh                           #
# author: Michael                   #
# Nov 7, 2020                       #
#                                   #
# Main script v0.1                  #
#***********************************#

source developemenuscript.sh # Welcome menu
source function_backup.sh # the actual backup function where the magic happens
# source restore
# source schedule

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
 echo "Edit the CONFIG file with your remote backup server."
 echo
 echo -e '-h, --help\tDisplays this help and exit'
 echo -e "-f, --full\tRuns a full (system config files, web and db, home dir)\n\t\tbackup on your system"
 echo -e "-m, --man\tRun manual backups on desired files and applications"
 echo
elif [[ "$PARAM" == "-f" ]] || [[ "$PARAM" == "--full" ]] # Run full backup (used for scheduling)
then
 backup full
elif [[ "$PARAM" == "-m" ]] || [[ "$PARAM" == "--man" ]] || [[ "$PARAM" == "" ]] # Load the user config menu (used for partial/manual backups)
then
 cat "floppy"
 echo
 welcomemenu
fi