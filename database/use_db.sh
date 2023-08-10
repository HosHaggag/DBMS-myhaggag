
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
    ./show_db.sh
    exit
fi

# check if first character is a letter
if [[ $1 =~ ^[a-zA-Z] ]]
then
    :
else
    echo "Invalid database name 3"
    exit
fi

# check if the database full name is valid and contains only .hgdb extension.

if [[  $1 =~ [^a-zA-Z0-9[.]] ]]
then
    echo "Invalid database name 4"
    exit
fi

# change directory to the database directory
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
            4) Exit to main menu"
            

read -r choice


case $choice in

       1 )
            echo "Enter the name of the table: "
            read -r tablename
            ./create_tb.sh $tablename
            ;;
        "Drop Table")
            echo "Enter the name of the table: "
            read -r tablename
            ./drop_tb.sh $tablename
            ;;
        "Select Table")
            echo "Enter the name of the table: "
            read -r tablename
            ./select_tb.sh $tablename
            ;;
        "show tables")
            ./show_tb.sh
            ;;    
        "Exit to main menu")
            cd ..
            exit
            ;;
        *)
            echo -n "Invalid choice "
            ;;
      
    esac
done
