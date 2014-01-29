#!/bin/bash
echo "Install node.js"
apt-get -y -f install npm > /dev/null

echo "Install npm global package"
npm config set registry http://registry.npmjs.org/
npm install -g grunt > /dev/null