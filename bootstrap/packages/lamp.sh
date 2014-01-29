#!/bin/bash

echo "Install LAMP"

apt-get -q -y install python-software-properties > /dev/null
add-apt-repository -y ppa:ondrej/php5 > /dev/null
apt-get -q -y update > /dev/null

apt-get -y install apache2 > /dev/null 2>&1
echo "ServerName localhost" >> /etc/apache2/apache2.conf

apt-get -y -f installmysql-server-5.5 phpmyadmin > /dev/null 2>&1
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/sites-enabled/phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

apt-get -y install php5 php5-curl php5-intl php5-gd php5-mysql > /dev/null 2>&1
sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
