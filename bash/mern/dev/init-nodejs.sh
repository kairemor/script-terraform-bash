#! /bin/bash

# Install nodejs and npm 
sudo apt update -y && sudo apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash - 
sudo apt install -y nodejs 

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
mkdir $PROJECT_NAME
cd $PROJECT_NAME

npm init --yes
npm install express cors mongoose

cat << EOF > index.js
const express = require('express')
const app = express()
const port = process.env.PORT || 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(\`App listening at http://localhost:\${port}\`)
})
EOF

node index 
