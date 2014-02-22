#!/bin/bash
apt-get -y install mysql-server > /dev/null  2>&1
mysqladmin -f -u root drop test
mysqladmin -u root password vagrant
mysql -f -u root --password=vagrant -D mysql <<< "DELETE FROM user WHERE password=''"

echo "Init phpmyadmin"
apt-get -y -f install phpmyadmin > /dev/null  2>&1
ln -s /usr/share/phpmyadmin /var/www/phpmyadmin
service apache2 restart