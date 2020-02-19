#!/usr/bin/env bash

sudo docker stop postgres
sudo docker rm postgres

#Get and run postgres docker container
sudo docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres

#Installing dbeaver
#wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
#echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
#sudo apt-get update && sudo apt-get install -y dbeaver-ce
