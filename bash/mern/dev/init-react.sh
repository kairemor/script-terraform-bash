#! /bin/bash

# Install nodejs and npm and yarn 
sudo apt update -y && sudo apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash - 
sudo apt install -y nodejs 
sudo npm install --global yarn


# get the project name from the [-n ] flag 
# [-n name]

PROJECT_NAME="app"

while getopts ":n:" options; do
    case $options in
        n) PROJECT_NAME=$OPTARG;;
        \?) echo "Invalid option -$OPTARG" >&2;;
    esac
done

# Initialize new project
npx create-react-app $PROJECT_NAME
cd $PROJECT_NAME

yarn install 
yarn add axios
yarn start


