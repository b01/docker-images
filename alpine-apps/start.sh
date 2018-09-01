#!/bin/sh

set -e

# Start a virtual screen, required for Firefox and Chrome.
Xvfb :99 -ac &

exec php-fpm7