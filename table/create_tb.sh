#! /usr/bin/bash 


# Functions 

function set_primary_key {

    select pk in $(cat $tbname".hgtb.config" | cut -d ":" -f 1) "exit"; do

        if [ $pk = "exit" ]
        then
            exit
        fi

        if [[ ! $(cat $tbname".hgtb.config" | cut -d ":" -f 1) ]]
        then
            echo -e $red"Column name is incorrect, enter exit to back to main menu "$reset
            continue 1
        fi

        echo $pk >> $tbname".hgtb.config"




        break
       
    done
    
}

# end of functions


# check if the database exists
set -x
ls 

echo $PWD





# create table script

while true 
do 

read -r -p "Enter the name of the table: " tbname

# check if syntax is correct

if [ $tbname = "exit" -o $tbname = "Exit" ]
then
    exit
fi


if [ -f $tbname".hgtb" ]
then
    echo -e $red"Table already exists"$reset
    continue 1
fi


if [[ ! $tbname =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
then
    echo -e $red"Syntax is incorrect, table name must start with a letter and can contain only letters, numbers and underscores, enter exit to back to main menu "$reset
    continue 1
fi


if [ -f $tbname".hgtb" ]
then
    echo -e $red"Table already exists"$reset
    continue 1
else
    touch $tbname".hgtb"
    touch $tbname".hgtb.config"
    read -r -p "Enter the number of columns: " colnum
    for (( i = 0; i < colnum; i++ )); do
        coltype=""
        read -r -p "Enter the name of column $((i+1)): " colname
        echo  "Enter the datatype of column  $((i+1)): "
        select coltype in "string" "integer"; do
            case $coltype in
                string ) coltype="string"; break;;
                integer ) coltype="integer"; break;;
                * ) echo "Please choose 1 or 2";;
            esac
        done
        echo -n -e "\n$colname:$coltype:" >> $tbname".hgtb.config"
    done
    echo -e $green"Table created successfully"$reset
fi



read -r -p "Do you want to set a primary key? (y/n) " ans

if [ $ans = "y" ];then
  set_primary_key  $tbname 
fi

read -r -p "do you want to create another table? (y/n)" cont
if [ $cont = "n" ];then
  exit
fi


done


set +x
