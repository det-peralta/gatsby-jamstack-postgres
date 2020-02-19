#!/usr/bin/env bash

sudo apt update && 
sudo apt -y upgrade && 

#Install curl
sudo apt install curl && 

#Install git
sudo apt install git &&

#Check nvm latest version - https://github.com/nvm-sh/nvm/releases
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Install nvm version
nvm install 10
nvm use 10

#Install gatsby-cli
npm install -g gatsby-cli

#Check all versions
nvm --version
node --version
gatsby --version
