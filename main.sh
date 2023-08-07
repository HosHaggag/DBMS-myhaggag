#! /usr/bin/bash



## this is the main script that will be used to run the project
PS3="myhaggag - main menu >>> "
red='\033[31m'
reset='\033[0m'

select choice in "Create Database" "Use Database" "Show Databases" "Drop Database" "Exit"
do
    case $choice in
        "Create Database")
            echo "Enter the name of the database: "
            read -r dbname
            ./create_db.sh $dbname
            ;;
        "Use Database")
            echo "Enter the name of the database: "
            read -r dbname
            ./use_db.sh $dbname".hgdb"
            ;;
        "Show Databases")
            ./show_db.sh
            ;;
        "Drop Database")
            echo "Enter the name of the database: "
            read -r dbname
            ./drop_db.sh $dbname
            ;;
        "Exit")
            exit
            ;;
        *)
            echo $red"Invalid choice please choose from the following:"$reset

            
            echo "
            1) Create Database
            2) Use Database 
            3) Show Databases
            4) Drop Database 
            5) Exit"
            ;;
    esac
done
