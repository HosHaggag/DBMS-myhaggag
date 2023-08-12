
# Create database




while true

do


read -rp  "Enter database name: " db_name

if [ $db_name = "exit" ]
then
    exit
fi


if [ -d $db_name".hgdb" ]
then
    echo "Database already exists, please enter another name"
    continue
fi

# check if first character is a letter

if [[ $db_name =~ ^[a-zA-Z] ]]
then
    :
else
    echo "Invalid database name, first character must be a letter"
    continue
fi

# check if the database full name is valid

if [[ $db_name =~ [^a-zA-Z0-9] ]]
then
    echo "Invalid database name, please enter a valid name"
    continue
fi

break

done

mkdir $db_name".hgdb"

echo "Database created successfully"

$root_dir/database/use_db.sh $db_name".hgdb"



