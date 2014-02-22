#!/bin/bash

VAGRANT_PATH='/vagrant/.vagrant/bootstrap';
BOOTSTRAP_PATH='/vagrant/bootstrap'
PACKAGE_PATH=$BOOTSTRAP_PATH/packages
CONFIG_PATH=$BOOTSTRAP_PATH/config
SYMFONY_PATH='/vagrant/symfony'
WWW_PATH='/var/www'

if [[ ! -d $VAGRANT_PATH ]]; then
  cat $BOOTSTRAP_PATH/logo
  echo "Init Bootstrap"
  mkdir $VAGRANT_PATH

  export DEBIAN_FRONTEND=noninteractive
  export LANGUAGE=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  locale-gen en_US.UTF-8 > /dev/null
  dpkg-reconfigure locales > /dev/null

  echo "Update VM"
  apt-get -q -y update > /dev/null

  echo "Finished"
fi

if [[ ! -f $VAGRANT_PATH/dot-files ]]; then
  echo "Install dot files"
  cp -r $BOOTSTRAP_PATH/dotfiles/.[a-zA-Z0-9]* ~/
  cp -r $BOOTSTRAP_PATH/dotfiles/.[a-zA-Z0-9]* /home/vagrant/
  chown -R vagrant /home/vagrant/.[a-zA-Z0-9]*
  touch $VAGRANT_PATH/dot-files
  echo "Finished"
fi

function install {
  package=$1
  if [[ -f $PACKAGE_PATH/$package.sh ]]; then
    if [[ ! -f $VAGRANT_PATH/install-$package ]]; then
      echo "Start install $package"
      . $PACKAGE_PATH/$package.sh
      touch $VAGRANT_PATH/install-$package
      echo "End $package"
    fi
  else
    echo "Fail!!!!"
  fi
}

install common
install lamp
install mongodb
install composer
install symfony
install node
