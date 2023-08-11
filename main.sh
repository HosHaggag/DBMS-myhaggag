#! /usr/bin/bash



## this is the main script that will be used to run the project
export PS3="myhaggag - main menu >>> "
export red='\033[31m'
export reset='\033[0m'
export green='\033[32m'
export root_dir="/home/hossamhaggag/DBMS-myhaggag"



while true 
do 

echo " 
1) Create Database
2) Use Database 
3) Show Databases
4) Drop Database 
5) Exit
     "


read -r choice

 case $choice in
        1)
            echo "Enter the name of the database: "
            read -r dbname
            $root_dir/database/create_db.sh $dbname
            ;;
        2)
            echo "Enter the name of the database: "
            read -r dbname
             $root_dir/database/use_db.sh $dbname".hgdb"
            ;;
        3)
            $root_dir/database/show_db.sh
            ;;
        4)
            echo "Enter the name of the database: "
            read -r dbname
            $root_dir/database/drop_db.sh $dbname
            ;;
        5)
            exit
            ;;
        *)
            echo $red"Invalid choice please choose from the following:"$reset
    esac
   
done
