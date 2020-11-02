#!/bin/bash

#***********************************#
# function_writelog.sh		 		#
# author: michael					#
# oct 31, 2020						#
#									#
# Write parsed messages to the log	#
#***********************************#

# Declare logfile
LOGFILE=backups.log

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# write_log ()										#
# Parameter: success[0]/fail[1], backup filename	#
# timestamp is added to the log entry				#
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function write_log () {
	STATUS=$1 # Pass argument 1 to STATUS
	BACKUP_FILENAME=$2 # Pass argument 2 to BACKUP_FILENAME
	if [[ $STATUS -eq 0 ]] # 0 = Successful backup
	then
		echo "["$(date +"%F %H:%M:%S")"] Backup OK: $BACKUP_FILENAME"
	elif [[ $STATUS -eq 1 ]] # 1 = Failed backup
	then
		echo "["$(date +"%F %H:%M:%S")"] Backup FAILED: $BACKUP_FILENAME"
	fi
}

# debug / test
foo="hostname_date_nginx_data.tar.gz"
write_log 1 $foo
write_log 0 $foo

# Need to add functionality for adding hashes (for integrity checks) to the log as well
# Add actually writing to the file once it looks good