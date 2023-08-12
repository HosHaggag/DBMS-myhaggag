# this file is used to delete a record from table

if [ $# -ne 1 ]
then
    echo "Syntax error, please enter the table name correctly"
    exit
fi

if [ ! -f $1".hgtb" -o ! -f $1".hgtb.config" ]
then
    echo "Table is not exist"
    exit
fi

# get the number of columns

