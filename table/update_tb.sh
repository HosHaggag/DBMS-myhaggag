#! /usr/bin/bash 

if [ $# -ne 1 ]
then
    echo "Syntax error, please enter the table name"
    exit
fi

while true

do

for file in $(cat $1".hgtb.config" | grep : ); do
    IFS=":" read -ra parts <<< "$file"
    for part in "${parts[@]}"; do
    printf "%-20s|" "$part"
    done
    echo
    for file in  $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1); do
    printf "%-0s|" "--------------------"  

    done
    echo
    

done



done



