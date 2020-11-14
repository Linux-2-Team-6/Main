#!/bin/bash
#
#******************************************#
# developemenuscript.sh                    #
# author: Rickard Andersson                #
# nov 12, 2020                             #
#                                          #
# A Menu for making backups                #
#******************************************#
  
source function_backup.sh

# Open ups a menu so that that user kan choose
# Which directories/configfiles/databases that should be backup

# 
# Below are the functions that makes the number two (2) menu for each choice made
# in menu 1. The functions start with funcy so that they hopefully won't collide with other functions

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcydatabase ()                                  #
# Parameter:                                        #
#                                                   #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcydatabase () {  #  This menu is for the database backup
    echo "Choose a backup option: "
    echo "a: Mariadb"
    echo "b: Return to main menu"
    echo "c: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) backup mariadb_data;; 
        "B" | "b" ) return;;
        "C" | "c" ) exit 0;;
                * ) echo "Please choose a letter option that is displayed "
        funcydatabase;;
    esac
} 

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcyweb ()                                       #
# Parameter:                                        #
#                                                   #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcyweb () {   # This menu is for the web backup
    echo "Choose a backup option: "
    echo "a: Nginx"
    echo "b: Return to main menu"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) backup;;
        "C" | "c" ) return;;
        "D" | "d" ) exit 0;;
        * ) echo "Please choose an option that is displayed "
       funcyweb;;
    esac
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcyconfig ()                                    #
# Parameter:                                        #
#                                                   #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcyconfig () { # This  menu is for web backup
    echo "Choose a backup option: "
    echo "a: Fullbackup"
    echo "b: Mariadb"
    echo "c: Nginx"
    echo "d: Mariadb and Nginx"
    echo "e: System config "
    echo "f: Return to main menu"
    echo "g: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) ;;        
        "B" | "b" ) backup mariadb_config;;
        "C" | "c" ) backup nginx_config;;
        "D" | "d" ) backup mariadb_config nginx_config;;
        "E" | "e" ) backup sys_config
        "F" | "f" ) return;;
        "G" | "g" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
        funcyconfig;;   
    esac
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcyfullbackup ()                                #
# Parameter:                                        #
#                                                   #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcyfullbackup () {        # This Menu is for fullbackup
    echo "Choose a backup option: "
    echo "a: Fullbackup"
    echo "b: Return to main menu"
    echo "c: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) backup;;        
        "B" | "b" ) return;;
        "C" | "c" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
        funcyfullbackup;;  
    esac
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcyhomedir()                                    #
# Parameter:                                       #
#                                                  #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcyhomedir () { # This menu is for home directory backup
    echo "Choose a backup option: "
    echo "a: Home-directory"
    echo "b: Return to main menu"
    echo "c: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) backup home;;        
        "B" | "b" ) return;;
        "C" | "c" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
       funcyhomedir;;
    esac
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# funcydatabaseAhomedir ()                          #
# Parameter:                                       #
#                                                  #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

funcydatabaseAhomedir () { # This menu is for database and home directory combined
    echo "Choose a backup option: "
    echo "a: Home-directory and Database backup"
    echo "b: Return to main menu"
    echo "c: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) backup;;        
        "B" | "b" ) return;; 
        "C" | "c" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
        funcydatabaseAhomedir;;
    esac
     
}

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# welcomemenu ()                                    #
# Parameter:                                        #
#                                                   #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

welcomemenu () {
# The echo command below makes a simple but pleasent welcome screen for the linux operator
echo " ************************************************                   
| Hello and welcome to this backup-script-1.0   |
| Do not hesitate to make a backup of your data!|
| With a blink of an eye                        |
| everything can be lost!                       |
|    A special thanks to the authors:           |
|    Rickard, Michael, Mikko and Peter!         |
*************************************************"
echo "# You will now be able to choose what to backup"
echo

while true                                          # This while loop makes the first menu!
do          echo "Main Menu"                        #
    echo "Choose what you want to backup: a, b, c.."
    echo "a: Fullbackup "
    echo "b: Web "
    echo "c: Databases "
    echo "d: Configfiles "
    echo "e: Homedir "
    echo "f: Databases+Homedir "
    echo "g: RESTORE a backup "
    echo "h: Exit "

    read -r -n1 REPLY                       #  
    echo ":Option $REPLY was chosen"        # Test, so that the variable get the right value, kredd to DB
echo 
    case "$REPLY" in                      
        "A" | "a" ) funcyfullbackup;;        # Example: In case "a" then the function funcyfullbackup gets called
        "B" | "b" ) funcyweb;;
        "C" | "c" ) funcydatabase;;
        "D" | "d" ) funcyconfig;;
        "E" | "e" ) funcyhomedir;;
        "F" | "f" ) funcydatabaseAhomedir;;
        "G" | "g" ) ;;
        "H" | "h" ) break;;
    esac
done
}

welcomemenu "$@"

exit 0