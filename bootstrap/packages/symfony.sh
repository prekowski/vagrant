#!/bin/bash
echo "Init symfony project"
mkdir -p ${SYMFONY_PATH}

cd ${SYMFONY_PATH}
composer create-project symfony/framework-standard-edition . 2.4.1

echo "Add phpunit"
composer require --dev phpunit/phpunit:3.7.*

ln -sf ${SYMFONY_PATH}/web ${WWW_PATH}/symfony
