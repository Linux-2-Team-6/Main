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

# Below i've roughly done the functions that makes the number two (2) menu for each chose made
# in menu 1. 
funcydatabase () {  # DB: Indentera all kod efter måsvinge för att visa visuellt hur koden hänger ihop. 
    echo "Choose a backup option: "
    echo "a: Mariadb"
    echo "b: Mysql"
    echo "c: Mariadb and Mysql"
    echo "d: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) echo "it works!";;        
        "B" | "b" ) ;;
        "C" | "c" ) ;;
        "D" | "d" ) exit 0;;
       
    esac
} 

funcyweb () {
    echo "Choose a backup option: "
    echo "a: "
    echo "b: "
    echo "c: "
    read -r -sn1
    read -r -n1 -p "Press any key to continue"
}

funcyconfig () {
    echo "Choose a backup option: "
    echo "a: Mariadb"
    echo "b: Mysql"
    echo "c: Mariadb and Mysql"
    echo "d: Exit"
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

# Welcome screen
echo " ************************************************                   
| Hello and welcome to this backup-script-1.0   |
| Do not hesitate to make a backup of your data!|
| With a blink of an eye                        |
| everything can be lost!                       |
 ************************************************"
echo "# You will now be able to choose what to backup"
echo

while true                                          # This while loop makes the first menu!
do                                                  #
    echo "Choose what you want to backup: a, b, c.."
    echo "a: Full-Backup "
    echo "b: Web "
    echo "c: Databases "
    echo "d: Configfiles "
    echo "e: Home_dir "
    echo "f: Databases+Home_dir "
    echo "g: Exit "

    read -r -n1 REPLY                       #  
    echo ":Option $REPLY was chosen"        # Test, se att variabel får rätt värde, kredd till DB
echo 
    case "$REPLY" in                     # 
        "A" | "a" ) funcybackup;;        # RA: Tex vid case "a" så callas funktionen funcybackup
        "B" | "b" ) funcyweb;;
        "C" | "c" ) funcydatabase;;
        "D" | "d" ) ;;
        "E" | "e" ) ;;
        "F" | "f" ) ;;
        "G" | "g" ) break;;
    esac
done

exit 0
