#! /usr/bin/bash

# check if the table name is valid

while true; do
    read -rp "Enter the name of the table: " tbname

    if [[ $tbname = "exit" || $tbname = "Exit" ]]; then
        exit
    fi

    if [[ $tbname =~ [^a-zA-Z0-9] ]]; then
        echo -e $red"Invalid table name"$reset
        continue 1
    fi



    if [ -f $tbname".hgtb"  -a -f $tbname".hgtb.config" ]
    then

        # delete the table

        rm $$tbname".hgtb"
        rm $tbname".hgtb.config"
        echo -e $green"Table deleted successfully"$reset
        break
    else
        echo -e $red"Table does not exist"$reset
        continue 1
       
    fi

    break
done


