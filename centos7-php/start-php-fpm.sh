#!/bin/bash -e

mkdir -p /run/php-fpm

php-fpm -D

touch /var/log/php-fpm.log
touch /var/log/php-fpm/www.log

chown -R apache:apache /var/log/php-fpm.log
chown -R apache:apache /var/log/php-fpm
chown -R apache:apache /var/log/php-fpm/www.log

tail -f /var/log/php-fpm.log \
     -f /var/log/php-fpm/www.log