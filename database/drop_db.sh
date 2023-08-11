
# delete a database

if [ $# -ne 1 ]
then
    echo "Invalid number of arguments"
    exit
fi

if [[ ! $1 =~ *.hgdb ]];then
    set -- "$1.hgdb" "$@"
    echo $1
fi

if [ ! -d $1 ]
then
    echo "Database not exists"
    exit
fi

rm -r $1
echo "Database deleted successfully"




