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

# 
# Below i've roughly done the functions that makes the number two (2) menu for each chose made
# in menu 1. The functions start with funcy so that they hopefully won't collide with other functions
funcydatabase () {  #  
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
                * ) echo "Please choose a letter option that is displayed "
        funcydatabase;;
    esac
} 

funcyweb () {
    echo "Choose a backup option: "
    echo "a: "
    echo "b: "
    echo "c: "
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) echo "it works!";;        
        "B" | "b" ) ;;
        "C" | "c" ) ;;
        "D" | "d" ) exit 0;;
        * ) echo "Please choose an option that is displayed "
       funcyweb;;
    esac
}

funcyconfig () {
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
                * ) echo "Please choose an option that is displayed "
        funcyconfig;;   
    esac
}

funcyfullbackup () {
    echo "Choose a backup option: "
    echo "a: Mariadb"
    echo "b: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) echo "it works!";;        
        "B" | "b" ) ;;
        "C" | "c" ) ;;
        "D" | "d" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
        funcyfullbackup  
    esac
}

funcyhomedir () {
    echo "Choose a backup option: "
    echo "a: Home-directory"
    echo "b: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) ;;        
        "B" | "b" ) exit 0;;
                * ) echo "Please choose an option that is displayed "
       funcyhomedir;;
    esac
}
funcydatabaseAhomedir () {
    echo "Choose a backup option: "
    echo "a: Home-directory and Database backup"
    echo "b: Exit"
    read -r -n1 REPLY                       
    echo ":Option $REPLY was chosen"        
echo
     case "$REPLY" in                   
        "A" | "a" ) echo "it works!";;        
        "D" | "d" ) exit 0;; 
                * ) echo "Please choose an option that is displayed "
        funcydatabaseAhomedir;;
    esac
     
}

welcomemenu () {
# The echo command below makes a simple but pleasent welcome screen for the linux operator
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
    echo "e: Homedir "
    echo "f: Databases+Homedir "
    echo "g: Exit "

    read -r -n1 REPLY                       #  
    echo ":Option $REPLY was chosen"        # Test, se att variabel får rätt värde, kredd till DB
echo 
    case "$REPLY" in                     # 
        "A" | "a" ) funcyfullbackup;;        # RA: Tex vid case "a" så callas funktionen funcybackup
        "B" | "b" ) funcyweb;;
        "C" | "c" ) funcydatabase;;
        "D" | "d" ) funcyconfig;;
        "E" | "e" ) funcyhomedir;;
        "F" | "f" ) funcydatabaseAhomedir;;
        "G" | "g" ) break;;
    esac
done
}

welcomemenu "$@"


exit 0
