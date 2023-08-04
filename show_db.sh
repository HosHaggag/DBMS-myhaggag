# show databases and check if there are any databases with extension .hgdb



if [ -z "$(ls | grep *.hgdb )"  ] ; then

    echo "No databases found"
    exit    
fi


    for file in "$(ls | grep *.hgdb )"
    do
    echo $file
    done
