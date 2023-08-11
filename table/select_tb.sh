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

export num_of_cols=$(cat $1".hgtb.config" | grep : | wc -l)
export num_of_skip_cols=$(cat $1".hgtb.config" | grep -v : | wc -l)

echo "cols: "$num_of_cols
echo "primary: "$num_of_skip_cols



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
        $root_dir/table/show_tb.sh $1
        ;;
    5)
        exit
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

   

done
