#! /usr/bin/bash




if ls *.hgtb.config 1> /dev/null 2>&1; then
    echo 
else
    echo "No Tables found please create one first"
    exit
fi


echo "$1 Tables:"
echo "---------------------"

for file in $(ls -l "$PWD" | grep ".hgtb.config" | awk '{print $9}' | cut -d "." -f 1); do
    printf "%-20s|\n" "$file"
echo "---------------------"
done



