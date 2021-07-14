#! /bin/bash
#install java 
sudo apt update 
sudo apt install -y default-jdk 
#install maven 
sudo apt install -y maven 


#install git 
sudo apt install -y git 

#get app name if given as params 
# [-n name] to give project name
app_name=app
while getopts ":n:" opt; do
  case $opt in
    n) app_name="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


#create new project 
git clone https://github.com/spring-guides/gs-spring-boot.git 
mv gs-spring-boot/initial $app_name 
rm -rf gs-spring-boot 
cd $app_name 
mvn spring-boot:run 



