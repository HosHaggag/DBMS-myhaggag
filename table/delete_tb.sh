# this file is used to delete a record from table

if [ $# -ne 1 ]
then
    echo "Syntax error, please enter the table name correctly"
    exit
fi



select choice in "Delete by primary key" "Delete by column value" "Exit"
do
    case $choice in
        "Delete by primary key")

            if [ ! $primary_key ];then
                echo -e $red "No primary key found"$reset
                continue 1
            fi
            echo "Enter the primary key value"
            read -r pk_value
            if [[ ! $(cat $1".hgtb" | cut -d ":" -f $primary_key_index | grep -w $pk_value) ]]
            then
                echo -e $red"Primary key value is not exist"$reset
                continue 1
            fi 
            sed -i "/^\([^:]*:\)\{$((primary_key_index - 1))\}$pk_value:/d" $1".hgtb"

            echo -e $green"Record deleted successfully"$reset
            break
            ;;
        "Delete by column value")
            echo "Enter the column name"
            read -r col_name
            if [[ ! $(cat $1".hgtb.config" | cut -d ":" -f 1 | grep -w $col_name) ]]
            then
                echo -e $red"Column name is not exist"$reset
                continue 1
            fi
            col_index=$(cat $1".hgtb.config" | cut -d ":" -f 1 | grep -n $col_name | cut -d ":" -f 1)
            echo "Enter the column value"
            read -r col_value
            if [[ ! $(cat $1".hgtb" | cut -d ":" -f $col_index | grep -w $col_value) ]]
            then
                echo -e $red"Column value is not exist"$reset
                continue 1
            fi
            sed -i "/^\([^:]*:\)\{$((col_index - 1))\}$col_value:/d" $1".hgtb"
            echo -e $green"Record deleted successfully"$reset
            break
            ;;
        "Exit")
            exit
            ;;
        *)
            echo -e $red"Invalid choice"$reset
            continue 1
            ;;
    esac
done

