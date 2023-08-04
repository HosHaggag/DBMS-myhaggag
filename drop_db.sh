
# delete a database

if [ $# -ne 1 ]
then
    echo "Invalid number of arguments"
    exit
fi

if [ ! -d $1 ]
then
    echo "Database not exists"
    exit
fi

# check if first character is a letter

if [[ $1 =~ ^[a-zA-Z] ]]
then
    :
else
    echo "Invalid database name"
    exit
fi

# check if the database full name is valid

if [[ $1 =~ [^a-zA-Z0-9] ]]
then
    echo "Invalid database name"
    exit
fi



rm -r $1