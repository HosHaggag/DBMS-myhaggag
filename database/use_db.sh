
# check if entery is not empty and not more than one

if [ $# -ne 1 ]
then
    echo "Invalid number of arguments"
    exit
fi

# check if database exists
if [ ! -d $1 ]
then
    echo "Database Not exists"
    echo "Please choose from the following databases:"
    $root_dir/database/show_db.sh
    exit
fi


# change directory to the database directory
echo "Changing directory to $1"
cd $1 

PS3="myhaggag - $1 >>> "

echo "You are now using $1 database"


while true
do 

echo "Please choose from the following:"
  echo "
1) Create Table
2) Drop Table 
3) Select Table
4) Show Tables
5) Exit to main menu
"
            

read -r choice


case $choice in

       1 )
            # echo "Enter the name of the table: "
            # read -r tablename
           $root_dir/table/create_tb.sh 
            ;;
        2)
            echo "Enter the name of the table: "
            read -r tablename
            $root_dir/table/drop_tb.sh $tablename
            ;;
        3)
            echo "Enter the name of the table: "
            read -r tablename
            $root_dir/table/select_tb.sh $tablename
            ;;
        4)
            $root_dir/table/show_tb.sh
            ;;    
        5)
            cd ..
            exit
            ;;
        *)
            echo -n "Invalid choice please choose from the following: "
            ;;
      
    esac
done



