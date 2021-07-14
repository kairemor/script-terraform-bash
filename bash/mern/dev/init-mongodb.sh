#! /bin/bash 

# Install mongodb
sudo apt-get update -y && \ 
 sudo apt-get install -y gnupg && \
 sudo apt-get install -y wget && \
 wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add - && \
 echo "deb http://repo.mongodb.org/apt/debian $(lsb_release -cs)/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
 sudo apt-get update -y && \
 sudo apt-get install -y mongodb-org && \
 echo "mongodb-org hold" | sudo dpkg --set-selections
 echo "mongodb-org-server hold" | sudo dpkg --set-selections
 echo "mongodb-org-shell hold" | sudo dpkg --set-selections
 echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
 echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Initialize mongodb
sudo systemctl daemon-reload
sudo systemctl start mongod 
sudo systemctl enable mongod
sudo systemctl status mongod