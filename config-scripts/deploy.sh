#!/bin/bash
work_dir="/opt"
echo -e "\e[6;34m Deploy app"
tput sgr0
apt-get update -qq
apt-get install -qq git -y
cd $work_dir
echo -e "\e[7m Download repo"
tput sgr0
git clone -b monolith https://github.com/express42/reddit.git
if [[ $? == 0 ]]
        then
          printf '\e[7;32m%-6s\e[m' "Download Succses"
          printf '\n'
        else
          printf '\e[7;31m%-6s\e[m'  "Download Error"
          printf '\n'
      fi

cd $work_dir/reddit && bundle install
puma -d
ps aux | grep puma
