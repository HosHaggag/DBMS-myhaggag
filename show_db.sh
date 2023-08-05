# show databases and check if there are any databases with extension .hgdb



if [ -z "$(ls | grep *.hgdb )"  ] ; then

    echo "No databases found"
    exit    
fi


for file in "$(ls | grep *.hgdb )"
do
    echo $file
done



select db in $(ls -l | grep *.hgdb | awk '{print $9}' ) "Exit to main menu"
do

   case $db in
        "Exit to main menu")
            exit
            ;;
        *)
         if [ -z "$db" ] ; then
         echo "Invalid choice please choose exist database or Exit to main menu"
        
         else
             echo "You are now using $db database"
             ./use_db.sh $db
            
             break
         fi
            ;;
    esac

   

   

   
done

