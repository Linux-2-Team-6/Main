#!/bin/bash

#***********************************#
# function_getfiles.sh              #
# author: michael                   #
# nov 11, 2020                      #
#                                   #
# Find which files are to be backed #
# up                                #
#***********************************#

# Check if there are more files for nginx, mariadb, sysconfig

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# getfiles ()                                       #
# Parameters: nginx, mariadb, sysconfig and/or home #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#


function getfiles () {
 
 while [ ! $1 == "" ] # while $1 isn't empty
 do
  local TARGET=$1

  if [[ "$TARGET" == "nginx_config" ]]
  then
   # declare array of nginx files to back up
   NGINX_CONFIG_FILES=("/etc/nginx/nginx.conf" "/etc/nginx/conf.d/" "/etc/nginx/sites-available/")
   #echo "${FILES[@]}"
  elif [[ "$TARGET" == "nginx_data" ]]
  then
   NGINX_DATA_FILES=("/usr/share/nginx/")
  elif [[ "$TARGET" == "mariadb_config" ]]
  then
   # declare array of mariadb config files to back up
   MARIADB_CONFIG_FILES=("/etc/my.cnf" "/etc/mysql/my.cnf" "$HOME/.my.cnf")
   #echo "${FILES[@]}"
  elif [[ "$TARGET" == "mariadb_data" ]]
  then
    # do a db dump
    MARIADB_DATA_FILES=("x")
  elif [[ "$TARGET" == "sysconfig" ]]
  then
   # declare array of system config files to back up
   SYS_FILES=("/etc/profile" "/etc/profile.d/" "/etc/bashrc" "/etc/sysctl.conf" "/etc/sysctl.d/" "/etc/resolve.conf" "/etc/passwd" "/etc/sysconfig/network-scripts/")
   #echo "${FILES[@]}"
  elif [[ "$TARGET" == "home" ]]
  then
   HOME_FILES=("$HOME/")
   #echo "${FILES[@]}"
  fi

  shift
 done

}

# test / debug
#getfiles $@