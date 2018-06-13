#!/bin/bash -e

# start NginX in the background
nginx

# start PHP-FPM server in the background
mkdir -p /run/php-fpm
chown -R root:root /run/php-fpm
php-fpm -D

#star virtual display in the background.
Xvfb :1 -screen 0 1024x768x16 &> /var/log/xvfb1.log  &
ps aux | grep X
dbus-daemon --system --fork
dbus-uuidgen --ensure

touch /var/log/php-fpm.log
touch /var/log/php-fpm/www.log

chown -R apache:apache /var/log/php-fpm.log
chown -R apache:apache /var/log/php-fpm
chown -R apache:apache /var/log/php-fpm/www.log

tail -f /var/log/php-fpm.log \
     -f /var/log/php-fpm/www.log \
     -f /var/log/nginx/access.log \
     -f /var/log/nginx/error.log \
     -f /var/log/xvfb1.log
