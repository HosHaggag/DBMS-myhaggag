#! /usr/bin/bash




PS3="myhaggag - $1 >>> "

echo "You are now using $1 database"


for file in $(ls | grep *.hgtb)
do
    echo "$file"
done

echo "Please choose from the following:"

select tb in $(ls | grep *.hgtb.config | cut -d . -f 1 ) "exit"
do
    if [ $tb = "exit" ]
    then
        exit
    fi

    if [[ ! $(ls | grep *.hgtb) ]]
    then
        echo "Table name is incorrect, enter exit to back to main menu "
        continue 1
    fi

    echo "You are now using $tb table"

    break
done



