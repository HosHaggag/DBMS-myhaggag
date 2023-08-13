#! /usr/bin/bash




if ls $1.hgtb.config 1> /dev/null 2>&1; then
    echo 
else
    echo "No Tables found please create one first"
    exit
fi

echo "$1 Table"

for file in  $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1); do
    printf "%-0s" "---------------------"  

    done
    echo
for file in  $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1); do
    printf "%-20s|" "$file"  

done
echo

for file in  $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1); do
    printf "%-0s|" "--------------------"  

done
echo
# list the table data

for file in $(cat $1".hgtb" | grep : ); do
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




