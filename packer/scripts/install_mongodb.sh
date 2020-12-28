#!/bin/bash
echo -e "\e[6;34m Run isntall MongoDb"
#tput sgr0
echo "Get Repo key"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sleep 30
apt-get install -qq apt-transport-https ca-certificates
sudo apt-get update -qq && sudo apt-get install -qq -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
