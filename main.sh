#! /usr/bin/bash

## this is the main script that will be used to run the project
PS3=">>> "


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
            read dbname
            ./use_db.sh $dbname
            ;;
        "Show Databases")
            ./show_db.sh
            ;;
        "Drop Database")
            echo "Enter the name of the database: "
            read dbname
            ./drop_db.sh $dbname
            ;;
        "Exit")
            exit
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done
