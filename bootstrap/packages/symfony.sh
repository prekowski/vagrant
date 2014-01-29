#!/bin/bash
echo "Init symfony project"
if [[ ! -d $SYMFONY_PATH ]]; then
  mkdir -p $SYMFONY_PATH
fi

cd $SYMFONY_PATH
composer create-project symfony/framework-standard-edition . 2.4.1 > /dev/null
composer require --dev phpunit/phpunit:3.7.*