#!/bin/sh

set -e

# Start a virtual screen, essential for smooth ride with Firefox or Chrome.
Xvfb :99 -ac &

exec php-fpm7