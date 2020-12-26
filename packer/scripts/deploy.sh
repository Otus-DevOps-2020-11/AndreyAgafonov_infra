#!/bin/bash
work_dir="/opt"
sleep 30
apt-get update -y
apt-get install git -y
cd $work_dir
git clone -b monolith https://github.com/express42/reddit.git
cd $work_dir/reddit && bundle install
puma -d
