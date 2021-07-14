#! /bin/bash
#install node js and npm 
sudo apt install -y curl  && /
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && /
sudo bash nodesource_setup.sh && /
sudo apt install -y nodejs && /

#install angular cli 
echo y | sudo npm install -g --silent @angular/cli && /

#get project name if given 
# [-n name] to give the project name as argument to script 

app_name=app-front
while getopts ":n:" opt; do
  case $opt in
    n) app_name="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


ng new $app_name --defaults
cd $app_name
ng serve --host 0.0.0.0
