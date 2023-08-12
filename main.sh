#! /usr/bin/bash



## this is the main script that will be used to run the project
export PS3="myhaggag - main menu >>> "
export red='\033[31m'
export reset='\033[0m'
export green='\033[32m'
export yellow='\033[33m'
export root_dir="/home/hossamhaggag/DBMS-myhaggag"

clear
echo -e "\n"

welcome_text="Welcome to myhaggag Database Management System!"
write_text="Written by: Hossam Haggag"
cols=$(tput cols)
printf "%*s\n" $(( (cols + ${#welcome_text}) / 2)) "$welcome_text"
printf "%*s\n" $(( (cols + ${#write_text}) / 2)) "$write_text"

echo -e "\n"



echo "You are now in the main menu"
echo "write exit to exit the program or back to the main menu"

while true 
do 

echo "Please choose from the following: "

echo " 
1) Create Database
2) Connect To Database 
3) Show Databases
4) Drop Database 
5) Exit
     "


read -r choice

 case $choice in
        1)
            $root_dir/database/create_db.sh
            ;;
        2)
            echo "Enter the name of the database: "
            read -r dbname
             $root_dir/database/use_db.sh $dbname
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
