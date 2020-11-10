#!/bin/bash

# Just a small menu example to show how it could work

function resetreply () {
  REPLY=
}

# Should we have one function per type of backup
#+ or rather one function "backup" with multiple options?
function fullbackup () {
  resetreply
  echo "Welcome to full backup"
  echo "[0] to return to main menu"
  
  read $REPLY
  
  case $REPLY in
   0)
    menu;;
   *)
    echo "[0] <- There's the door!"
    menu;;
  esac
}

function webbackup() {
  echo "Welcome to web backup"
  echo "There doesn't seem to be anything here at the moment..."
  menu
}

function dbbackup() {
  echo "Welcome to db backup"
  echo "There doesn't seem to be anything here at the moment..."
  menu
}


function menu() {
  resetreply
  CHECK=0

  while [[ CHECK -eq 0 ]]
  do
  echo "Choose an option from the menu"
  echo "[1] Full backup"
  echo "[2] Web"
  echo "[3] Databases"
  echo "[0] Exit"

  read $REPLY

  case $REPLY in
    1)
    fullbackup
    CHECK=1;;
    2)
    webbackup
    CHECK=1;;
    3)
    dbbackup
    CHECK=1;;
    0)
    exit 0;;
    *)
    CHECK=0;;
  esac
  done
  }

  menu