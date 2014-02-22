#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get -y -f install mysql-server-5.5
mysqladmin -f drop test
mysqladmin -f -u root password vagrant
mysql -f -u root --password=vagrant -D mysql <<< "DELETE FROM user WHERE password=''"

echo "Init phpmyadmin"
apt-get -y -f install phpmyadmin > /dev/null 2>&1
ln -sf /usr/share/phpmyadmin /var/www/phpmyadmin
service apache2 restart