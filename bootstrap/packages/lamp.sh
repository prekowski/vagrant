#!/bin/bash

echo "Install LAMP"
export DEBIAN_FRONTEND=noninteractive

echo "Add repository and update"
apt-get -q -y install python-software-properties > /dev/null  2>&1
add-apt-repository -y ppa:ondrej/php5 > /dev/null  2>&1
apt-get -q -y update > /dev/null  2>&1

echo "Init apache2"
apt-get -y install apache2 > /dev/null  2>&1
a2enmod rewrite

echo "ServerName localhost" >> /etc/apache2/apache2.conf
sed -i 's/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
sed -i 's/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars

echo "Init mysql"
apt-get -y install mysql-server > /dev/null  2>&1
mysqladmin -f -u root drop test
mysqladmin -u root password vagrant
mysql -f -u root --password=vagrant -D mysql <<< "DELETE FROM user WHERE password=''"

echo "Init php"
apt-get -y install php5 php5-curl php5-intl php5-gd php5-mysql php-pear php5-dev > /dev/null  2>&1
sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini

echo "Init phpmyadmin"
apt-get -y -f install phpmyadmin > /dev/null  2>&1
ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

echo "Init xdebug"
sudo pecl install xdebug > /dev/null  2>&1
XDEBUG_PATH=`find / -name 'xdebug.so' 2> /dev/null`
echo "zend_extension=\"$XDEBUG_PATH\"" >> /etc/php5/apache2/php.ini

service apache2 restart