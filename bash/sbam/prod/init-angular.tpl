#! /bin/bash
# Install base packages
sudo apt update -y && sudo apt-get install -y apt-transport-https ca-certificates gnupg && sudo apt install -y curl
# Install git
sudo apt-get install -y git
# Install Nginx
sudo apt install -y nginx
# Install NodeJS, npm and yarn
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install --global yarn
# Install certbot
sudo apt install -y snapd && \
sudo snap install core; sudo snap refresh core
sudo apt-get install -y certbot && \
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
# Get environment variables

# Deploy project
git clone ${PROJECT_REPOSITORY}
cd ${PROJECT_NAME}
ls 

DOTENV=".env"

# Check if .env exits
if ! test -f $DOTENV; then
    # If .env doesn't exist create it and set env variable
    echo "BACKEND_URL=\"${BACKEND_URL}\"" > .env
else
    # If .env exists but env variable doesn't exist set env variable
    if ! grep -q "BACKEND_URL" $DOTENV; then
        echo "BACKEND_URL=\"${BACKEND_URL}\"" >> .env
    else
    # if .env exists and env variable exist reset env variable
        sed -e -i "/BACKEND_URL/c\BACKEND_URL=\"$BACKEND_URL\"" $DOTENV
    fi
fi

npm i
npm run-script build --prod
sudo rm -rf /var/www/html/*
ls ./dist/${PROJECT_NAME}
sudo cp -r ./dist/${PROJECT_NAME}/* /var/www/html
sudo nginx -t && sudo systemctl restart nginx
# external_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)