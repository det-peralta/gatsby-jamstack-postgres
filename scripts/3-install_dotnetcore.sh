#!/usr/bin/env bash

#Register Microsoft key and feed
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

#Install the .NET Core SDK
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2

rm -rf packages-microsoft-prod.deb

cd netcore-webapi-postgres/EFCorePostgreSQL

dotnet run
