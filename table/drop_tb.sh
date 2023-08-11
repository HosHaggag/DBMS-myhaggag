#! /usr/bin/bash



# color variables
red='\033[31m'
green='\033[32m'
reset='\033[0m'

# end of color variables

# check if the database exists

if [[ ! $1 =~ *.hgdb ]];then
    set -- "$1.hgdb" "$@"
    echo $1
fi



if [ ! -d $1 ]
then
    echo -e $red"Database does not exist"$reset
    exit
fi

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


    if [ -f $1/$tbname".hgtb" ]
    then

        # delete the table

        rm $1/$tbname".hgtb"
        echo -e $green"Table deleted successfully"$reset
        break
    else
        echo -e $red"Table does not exist"$reset
        continue 1
       
    fi

    break
done


