#!/bin/bash
if [[ ! -d $SYMFONY_PATH ]]; then
  echo "Init symfony project"
  mkdir -p $SYMFONY_PATH
  cd $SYMFONY_PATH
  composer create-project symfony/framework-standard-edition . 2.4.1 > /dev/null

  echo "Add phpunit"
  composer require --dev phpunit/phpunit:3.7.* > /dev/null
else
  echo "Symfony project exists"
fi

ln -sf $SYMFONY_PATH/web ${WWW_PATH}/symfony