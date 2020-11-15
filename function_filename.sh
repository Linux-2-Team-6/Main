#!/bin/bash

#***********************************#
# function_filename.sh              #
# author: Michael                   #
# Nov 15, 2020                      #
#                                   #
# Creating unique-ish filenames     #
#***********************************#

function filename () {

# get hostname
local HOSTNAME=$(hostname)
IFS='.'
read -a hostarr <<<"$HOSTNAME"

# get date
local NOW=$(date +"%Y-%m-%d_%H%M")

# create a backup filename
BACKUP_FILENAME+="${hostarr[0]}"
BACKUP_FILENAME+="_$NOW"
BACKUP_FILENAME+=".tar.gz"

}
