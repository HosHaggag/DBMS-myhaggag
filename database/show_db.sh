# show databases and check if there are any databases with extension .hgdb




if ls *.hgdb 1> /dev/null 2>&1; then
    echo 
else
    echo "No Databases found please create one first"
    exit
fi



files=$(ls | grep *.hgdb *)

echo files $files


while true
do
echo "Please choose from the following:"
i=0

for file in "$(ls | grep *.hgdb * )"
do
 # show databases without extension .hgdb and number them
    echo "$((i++)). ${file%.*}"
done

read -r db


 case $db in
        "exit")
            exit
            ;;
        files[$db] )
         if [ -z "$db" ] ; then
         echo "Invalid choice please choose exist database or Exit to main menu"
        
         else
             echo "You are now using $db database"
              $root_dir/database/use_db.sh $db
            
             break
         fi
            ;;
        *) 
            echo $red"Invalid choice please choose exist database or Exit to main menu"$reset
            echo $db 
            echo $files[$db]
            echo $red 
            echo $files     
esac

done

