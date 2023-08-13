#! /usr/bin/bash

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

PS3="myhaggag >> "

# get the number of columns

export num_of_cols=$(cat $1".hgtb.config" | grep : | wc -l)
export num_of_skip_cols=$(cat $1".hgtb.config" | grep -v : | wc -l)

export array_of_cols=( $(cat $1".hgtb.config" | grep : | cut -d ":" -f 1) )
export array_of_types=( $(cat $1".hgtb.config" | grep : | cut -d ":" -f 2) )

if [ ! $(cat $1".hgtb.config" | grep -v : ) ];then
    echo "No primary key found"
    else
export primary_key=$(cat $1".hgtb.config" | grep -v : )
export primary_key_index=$(cat $1".hgtb.config" | grep : | cut -d ":" -f 1 | grep -n $primary_key | cut -d ":" -f 1)
fi




echo "cols: "$num_of_cols
echo primary: $primary_key






while true 

do 

echo "
1) Insert new record
2) Delete record
3) Update record
4) Show table
5) Exit
" 

read -r  choice

case $choice in 

    1)
        $root_dir/table/insert_tb.sh $1
        ;;
    2)
        $root_dir/table/delete_tb.sh $1
        ;;
    3)
        $root_dir/table/update_tb.sh $1
        ;;
    4)
        $root_dir/table/show_selected_tb.sh $1
        ;;
    5)
        exit
        ;;
    *)
        echo "Invalid choice"
        ;;
esac


done
