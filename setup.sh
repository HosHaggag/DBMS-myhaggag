#! /usr/bin/bash


LIB_DIR="/lib/myhaggag"
ALIAS_NAME="myhaggag"

if [ -d "$LIB_DIR" ]; then
    echo "Project already setup!"
    exit 1
fi

# Create the lib directory
 

mkdir -p $LIB_DIR

# Copy the lib files to the lib directory
cp -r DBMS-myhaggag $LIB_DIR

# add execute permission to the lib files
chmod u+x $LIB_DIR/*.sh
chmod u+x $LIB_DIR/database/*.sh
chmod u+x $LIB_DIR/table/*.sh


echo "alias $ALIAS_NAME='bash $LIB_DIR/db_functions.sh'" >> ~/.bashrc

source ~/.bashrc

echo "
Project setup completed successfully!
************************************************
To start using the project, run the following command in your database directory:
$ myhaggag
"




