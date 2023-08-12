#! /usr/bin/bash

array_of_cols=( $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1) )
array_of_types=( $(cat $1".hgtb.config" | grep : | cut -d ":" -f 2) )
primary_key=$(cat $1".hgtb.config" | grep -v : )


echo cols: $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1 )
echo primary: $(cat $1".hgtb.config" | grep -v : )

record=""
while true
do 



for (( i=0; i<${#array_of_cols[@]}; i++ ))
do 

while true

do

read -rp " Enter value of column ${array_of_cols[$i]} : " col_value

if [[ $col_value = "exit" || $col_value = "Exit" ]]
then
    exit
fi

if [ ${array_of_types[$i]} = "string" ]
then
    if [[ $col_value = *":"* ]]
    then
        echo -e $red"Syntax is incorrect, value must not contain colon, enter exit to back to main menu "$reset
        continue 1
    fi
fi

if [ ${array_of_types[$i]} = "integer" ]
then
    # check if the value is full number
    if [[ ! $col_value  =~ ^[0-9]+$ ]]
    then
        echo -e $red"Syntax is incorrect, value must be an integer, enter exit to back to main menu "$reset
        continue 1
    fi
fi

if [ ${array_of_cols[$i]} = $primary_key ]
then
    if [[ $(cat $1".hgtb" | cut -d ":" -f $((i+1)) | grep -w $col_value) ]]
    then
        echo -e $red"Syntax is incorrect, value must be unique, enter exit to back to main menu "$reset
        continue 1
    fi
fi

break

done
record=$record$col_value":"


done


echo $record >> $1".hgtb"

echo -e $green"Record inserted successfully"$reset

echo -e $yellow"Enter another record? (y/n)"$reset
read -r ans
if [[ $ans = "n" || $ans = "N" ]]
then
    break
fi

done



# get the number of columns

num_of_cols=$(cat $1".hgtb.config" | grep ":" | wc -l)
num_of_skip_cols=$(cat $1".hgtb.config" | grep -v ":" | wc -l)

echo $num_of_cols
echo $num_of_skip_cols


