#!/bin/bash
#
#******************************************#
# developemenuscript.sh                    #
# author: Rickard Andersson                #
# oct 29, 2020                             #
#                                          #
# A Menu for making backups                #
#******************************************#
  
# Open ups a menu so that that user kan choose
# Which directories/configfiles/databases that should be backup
  
# Choose yes and no
# 
# 

# The echo command below makes a simple but pleasent welcome screen for the linux operator 

echo " ************************************************                   
| Hello and welcome to this backup-script-1.0   |
| Do not hesitate to make a backup of your data!|
| With a blink of an eye                        |
| everything can be lost!                       |
 ************************************************
"
echo "# You will now be able to choose what to backup"

echo
 

while true                                              # This while loop makes the first menu!
    do                                                  #
    echo "Choose what you want to backup: 1-7"
    echo "1: Full-Backup "
    echo "2: Web "
    echo "3: Databases "
    echo "4: Configfiles "
    echo "5: Home_dir "
    echo "6: Databases+Home_dir "
    echo "7: Exit "

    read -n1 
    REPLY=$( to_lower "$REPLY")                     # Here the to_lower function get called but it does not work
    case "$REPLY" in                                # It's says "command not found" when the script is runned
    1) funcybackup;;
    2) funcyweb;;
    3) funcydatabase;;
    4)              ;;
    5)              ;;
    6)              ;;
    7) exit 0;;

    esac
    done


to_lower () {                                       # This function should take the user from 
input="$1"                                          # menu 1 to the menu 2 depending what he choose
output=$( echo "$input" | tr [A-Z] [a-z])
return "$output"
}


# Below i've roughly done the functions that makes the number two (2) menu for each chose made
# in menu 1. 

funcydatabase () {
echo "Choose a backup option: "
echo "1: Mariadb"
echo "2: Mysql"
echo "3: Mariadb and Mysql"
echo "4: Exit"
read -r -sn1
read -r -n1 -p "Press any key to continue"
} 

funcyweb () {
echo "Choose a backup option: "
echo "1: "
echo "2: "
echo "3: "

}

funcyconfig () {
echo "Choose a backup option: "
echo "1: Mariadb"
echo "2: Mysql"
echo "3: Mariadb and Mysql"
echo "4: Exit"
read -r -sn1
read -r -n1 -p "Press any key to continue"

}

funcybackup () {
echo "Choose a backup option: "
echo "1: Mariadb"
echo "4: Exit"
read -r -sn1
read -r -n1 -p "Press any key to continue"

}

funcybackup "$@"



exit 0