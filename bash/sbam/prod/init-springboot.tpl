#! /bin/bash
#install java 
sudo apt update
sudo apt install -y default-jdk
java -version

#install maven 
sudo apt install -y maven
mvn -version

#install git 
sudo apt install -y git

#install wget 
sudo apt install -y wget 


#get backend and frontend url files 
# [-s backend_url]

#jar_url="https://github.com/kairemor/spring-boot-dockerise/blob/master/cloud-devops-0.0.1-SNAPSHOT.jar?raw=true"
jar_url="${PROJECT_REPOSITORY}"
port="${PORT}"
app="${PROJECT_NAME}"
DB_URI = ""
MAIN_FILE = ""

# get jar file 
wget -O app.jar $jar_url  

wget https://storage.googleapis.com/template_repository/modules/nginx/init-nginx.sh

#deploy to nginx 
bash ./init-nginx.sh -s $(ip -4 addr show eth0 | grep -oP "(?<=inet ).*(?=/)"):$port -n$app

# run project 
java -jar app.jar

#reload nginx
sudo systemctl restart nginx

