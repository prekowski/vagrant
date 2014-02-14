#!/bin/bash

echo "Install MongoDB"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 > /dev/null  2>&1
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list > /dev/null  2>&1
sudo apt-get update > /dev/null  2>&1
apt-get -y install mongodb-10gen > /dev/null  2>&1