#!/usr/bin/env bash

cd gatsby-postgres

npm install
npm install --save gatsby-plugin-offline 
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p 

cd ..