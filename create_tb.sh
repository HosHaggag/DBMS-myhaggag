#! /usr/bin/bash 


# Functions 

function set_primary_key {

    select pk in $(cat $tbname".hgtb.config" | cut -d ":" -f 1); do

        if [ $pk = "exit" ]
        then
            exit
        fi

        if [[ ! $pk =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
        then
            echo -e $red"Syntax is incorrect, column name must start with a letter and can contain only letters, numbers and underscores"$reset
            continue 1
        fi

        if [[ ! $(cat $tbname".hgtb.config" | cut -d ":" -f 1) ]]
        then
            echo -e $red"Column name is incorrect, enter exit to back to main menu "$reset
            continue 1
        fi

        break
       
    done

   


    read -r -p "Enter the name of the column you want to be the primary key, enter exit to back to main menu" pk
    if [ $1 = "exit" ]
    then
        exit
    fi

    if [[ ! $1 =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
    then
        echo -e $red"Syntax is incorrect, column name must start with a letter and can contain only letters, numbers and underscores"$reset
        continue 1
    fi

    if [[ ! $(cat $tbname".hgtb.config" | grep -w $pk) ]]
    then
        echo -e $red"Column name is incorrect, enter exit to back to main menu "$reset
        continue 1
    fi

    echo $pk >> $tbname".hgtb.config"

    

    
}

# end of functions




# color variables
red='\033[31m'
green='\033[32m'
reset='\033[0m'

# end of color variables


# create table script
cd $1

while true 
do 

read -r -p "Enter the name of the table: " tbname

# check if syntax is correct

if [ $tbname = "exit" -o $tbname = "Exit" ]
then
    exit
fi


if [[ ! $tbname =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
then
    echo -e $red"Syntax is incorrect, table name must start with a letter and can contain only letters, numbers and underscores, enter exit to back to main menu "$reset
    continue 1
fi


if [ -f $tbname".hgtb" ]
then
    echo $red"Table already exists"$reset
    continue 1
else
    touch $tbname".hgtb"
    touch $tbname".hgtb.config"
    read -r -p "Enter the number of columns: " colnum
    for (( i = 0; i < colnum; i++ )); do
        read -r -p "Enter the name of column $((i+1)): " colname
        read -r -p "Enter the datatype of column  $((i+1)): " coltype
        select coltype in "string" "integer"; do
            case $coltype in
                string ) coltype="string"; break;;
                integer ) coltype="integer"; break;;
                * ) echo "Please choose 1 or 2";;
            esac
        done
        echo -n "$colname:$coltype:" >> $tbname".hgtb.config"
    done
    echo $green"Table created successfully"$reset
fi



read -r -p "Do you want to set a primary key? (y/n) " ans

if [ $ans = "y" ];then
  set_primary_key  $tbname 
fi

read -r -p "do you want to create another table? (y/n) \c" cont
if [ $ans = "n" ];then
  break
fi


done



