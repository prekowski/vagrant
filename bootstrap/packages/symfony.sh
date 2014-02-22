#!/bin/bash
if [[ ! -d ${SYMFONY_PATH} ]]; then
  mkdir -p ${SYMFONY_PATH}

  cd ${SYMFONY_PATH}
  composer create-project symfony/framework-standard-edition . 2.4.1

  echo "Add phpunit"
  composer require --dev phpunit/phpunit:3.7.*

  cp ${CONFIG_PATH}/vagrant-vhost /etc/apache2/sites-available/
  ln -s /etc/apache2/sites-available/vagrant-vhost /etc/apache2/sites-enabled/vagrant-vhost
  service apache2 restart
else
  cd ${SYMFONY_PATH}
fi

if [[ ! -d ${SYMFONY_PATH}/vendor ]]; then
  composer install
fi

./app/console assets:install web
./app/console cache:clear

rm -rf ${WWW_PATH}
ln -sf ${SYMFONY_PATH}/web ${WWW_PATH}
