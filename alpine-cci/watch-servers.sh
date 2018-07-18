#!/bin/sh -e

# This script is the controller for starting and stopping the servers.
# It is the entry point and still receive the signals when it is time to shutdown.
# These web pages helped explain how to handle the signals Docker send to shutdown the container.
#   https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers/
#   https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86

watchServers () {
    # PID is in file: /var/run/nginx.pid
    echo "stopping NGinX server."
    nginx -c /etc/nginx/custom-nginx.conf -s stop

    echo "stopping PHP-FPM server."
    # PID is in file: /var/run/php-fpm.pid
    kill -9 `cat /var/run/php-fpm.pid`

    echo "stopping PHP-FPM server."
    # PID is in file: /var/run/dbus.pid
    kill -9 `cat /var/run/dbus.pid`
}

trap 'watchServers' SIGTERM

keepRunning=true

while true; do
    if [ "${keepRunning}" = 'false' ]; then
        break
    fi
    sleep 3
done
