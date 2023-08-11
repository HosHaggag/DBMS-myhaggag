#! /usr/bin/bash


LIB_DIR="/lib/myhaggag"
ALIAS_NAME="myhaggag"

if [ -d "$LIB_DIR" ]; then
    echo "Project already setup!"
    exit 1
fi
 

mkdir -p $LIB_DIR

echo "alias $ALIAS_NAME='bash $LIB_DIR/db_functions.sh'" >> ~/.bashrc

source ~/.bashrc

echo "
Project setup completed successfully!
************************************************
To start using the project, run the following command in your database directory:
$ myhaggag
"


