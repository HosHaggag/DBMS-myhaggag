#! /usr/bin/bash


if [ $# -ne 1 ]
then
    echo "Syntax error, please enter the table name correctly"
    exit
fi

if [ ! -f $1".hgtb" ]
then
    echo "Table is not exist"
    exit
fi



# get the number of columns

num_of_cols=$(cat $1".hgtb.config" | grep ":" | wc -l)
num_of_skip_cols=$(cat $1".hgtb.config" | grep -v ":" | wc -l)

echo $num_of_cols
echo $num_of_skip_cols


