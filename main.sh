#! /usr/bin/bash

## this is the main script that will be used to run the project
PS3="myhaggag - main menu >>> "


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
            echo "Invalid choice please choose from the following:"

            
            echo "
            1) Create Database
            2) Use Database 
            3) Show Databases
            4) Drop Database 
            5) Exit"
            ;;
    esac
done
