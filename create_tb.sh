#! /usr/bin/bash 

# create table script

red='\033[31m'
green='\033[32m'
reset='\033[0m'

cd $1

while true 
do 

read -r -p "Enter the name of the table: " tbname

# check if syntax is correct
# explain the syntax

if [ $tbname = "exit" ]
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
        read -r -p "Enter the datatype of column $((i+1)): " coltype
        echo -n "$colname:$coltype:" >> $tbname".hgtb.config"
    done
    echo $green"Table created successfully"$reset
fi

read -r -p "Do you want to set a primary key? (y/n) " ans

if [ $ans = "y" ]
  set_primary_key ( $tbname )
then
    break
fi

echo -e "Enter the name of the column you want to be the primary key, enter exit to back to main menu"
read -r pk
if [ $pk = "exit" ]
then
    exit
fi

if [[ ! $pk =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
then
    echo -e $red"Syntax is incorrect, column name must start with a letter and can contain only letters, numbers and underscores, enter exit to back to main menu "$reset
    continue 1
fi

if [[ ! $(cat $tbname".hgtb.config" | grep -w $pk) ]]
then
    echo -e $red"Column name is incorrect, enter exit to back to main menu "$reset
    continue 1
fi

echo $pk >> $tbname".hgtb.config"



done


function set_primary_key ( $tbname ) {

    while true
    do


    read -r -p "Enter the name of the column you want to be the primary key, enter exit to back to main menu" pk
    if [ $pk = "exit" ]
    then
        exit
    fi

    if [[ ! $pk =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]
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

    break

    done
}


