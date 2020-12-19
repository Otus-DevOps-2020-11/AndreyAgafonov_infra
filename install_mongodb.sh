#!/bin/bash
echo -e "\e[6;34m Run isntall MongoDb"
tput sgr0
echo "Get Repo key"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get install -qq apt-transport-https ca-certificates
sudo apt-get update -qq
sudo apt-get install -qq -y mongodb-org
if [[ $? == 0 ]]
        then
          printf '\e[7;32m%-6s\e[m' "Install Succses"
          printf '\n'
        else
          printf '\e[7;31m%-6s\e[m'  "Install Error"
          printf '\n'
      fi
sudo systemctl start mongod
if [[ $? == 0 ]]
        then
          printf '\e[7;32m%-6s\e[m' "Service started"
          printf '\n'
        else
          printf '\e[7;31m%-6s\e[m'  "Error strting mongoDB"
          printf '\n'
      fi
sudo systemctl enable mongod
if [[ $? == 0 ]]
        then
          printf '\e[7;32m%-6s\e[m' "Service MongoDB added into autorun"
          printf '\n'
        else
          printf '\e[7;31m%-6s\e[m'  "Error"
          printf '\n'
      fi

systemctl status mongod |grep -E "Loaded|Active"
echo "Bye"
tput sgr0
