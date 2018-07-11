#!/bin/sh -e

# This script is the controller for starting and stopping the servers.
# It is the entry point and still receive the signals when it is time to shutdown.
# These web pages helped explain how to handle the signals Docker send to shutdown the container.
#   https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers/
#   https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86

trap 'exit 0' SIGTERM

# start a virtual display in the background.
Xvfb :1 -screen 0 1024x768x16 &> /var/log/xvfb1.log  &
# PID is in file: /var/run/dbus.pid
dbus-daemon --system --fork
dbus-uuidgen --ensure

# start NginX in the background
# PID is in file: /var/run/nginx.pid
nginx -c /etc/nginx/custom-nginx.conf

# start PHP-FPM server in the background
# PID is in file: /var/run/php-fpm.pid
php-fpm -c /usr/local/etc/php/php-fpm.conf

while true; do :; done