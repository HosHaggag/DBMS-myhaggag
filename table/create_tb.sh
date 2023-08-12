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



# create table script

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


if [ -f $tbname".hgtb" -o -f $tbname".hgtb.config" ]
then
    echo -e $red"Table already exists"$reset
    continue 1
else
    touch $tbname".hgtb"
    touch $tbname".hgtb.config"

    while true
    do

    read -rp "Enter the number of columns: " colnum

    if [[ ! $colnum =~ ^[1-9]+$ ]]
    then
        echo -e $red"Syntax is incorrect, number of columns must be a number, enter exit to back to main menu "$reset
        continue 1
    fi

    break

    done

    for (( i = 0; i < colnum; i++ )); do

        while true
        do
            read -r -p "Enter the name of column $((i+1)): " colname

            if [[ $colname = "exit" || $colname = "Exit" ]]; then
                exit
            fi

            if [[ ! $colname =~ ^[a-zA-Z][a-zA-Z0-9_]*$ ]]; then
                echo -e $red"Syntax is incorrect, column name must start with a letter and can contain only letters, numbers and underscores, enter exit to back to main menu "$reset
                continue 1
            fi

            if [[ $(cat $tbname".hgtb.config" | cut -d ":" -f 1) =~ $colname ]]; then
                echo -e $red"Column name already exists"$reset
                continue 1
            fi

            break
            
        done
        coltype=""

        while true 
        do 
        echo  "Enter the datatype of column  $((i+1)): "

        echo "1) string"
        echo "2) integer"

        read -r -p "Enter your choice: " choice

        case $choice in
            1)
                coltype="string"
                ;;
            2)
                coltype="integer"
                ;;
            *)
                echo -e $red"Syntax is incorrect, enter exit to back to main menu "$reset
                continue 1
                ;;
        esac
        echo "$colname:$coltype" >> $tbname".hgtb.config"
        break
        done
    done
    echo "Table created successfully"
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


