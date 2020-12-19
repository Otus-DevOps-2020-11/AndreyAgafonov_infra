#!/bin/bash
echo -e "\e[7;34m Run install ruby"
tput sgr0
sudo apt update -qq
sudo apt install -qq -y ruby-full ruby-bundler build-essential
if [[ $? == 0 ]]
        then
          printf '\e[7;32m%-6s\e[m' "Install Succses"
          printf '\n'
        else
          printf '\e[7;31m%-6s\e[m'  "Install Error"
          printf '\n'
      fi
echo -e "\e[6;34m $(ruby -v)"
tput sgr0
echo -e "\e[6;34m $(bundler -v)"
tput sgr0
