#!/bin/bash
apt-get -y -f install npm > /dev/null  2>&1

echo "Install npm global package"
npm config set registry http://registry.npmjs.org/
npm install -g grunt > /dev/null  2>&1
