# show databases and check if there are any databases with extension .hgdb


if ls *.hgdb 1> /dev/null 2>&1; then
    echo 
else
    echo "No Databases found please create one first"
    exit
fi



for file in "$( ls -F $PWD | grep ".hgdb" | cut -d . -f 1 )"
do
    echo "$file"
    echo "---- "
done



