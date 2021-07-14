#! /bin/bash
#install mysql 
sudo apt-get update
sudo apt install -y mysql-server

#configuration security
sudo mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('sonatel221');FLUSH PRIVILEGES;"

sudo mysql -e "DELETE FROM mysql.user WHERE User='';"

sudo mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"


#get app name if given as params
# [-n name] to give project name
dbname=app
while getopts ":n:" opt; do
  case $opt in
    n) dbname="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


#database creation 
sudo mysql -uroot -e "CREATE DATABASE ${dbname}"

