# show databases and check if there are any databases with extension .hgdb


if ls *.hgdb 1> /dev/null 2>&1; then
    echo 
else
    echo "No Databases found please create one first"
    exit
fi


echo "Databases:"
echo "---------------------"

for file in $(ls -l "$PWD" | grep ".hgdb" | awk '{print $9}' | cut -d "." -f 1); do
    printf "%-20s|\n" "$file"
echo "---------------------"
done



