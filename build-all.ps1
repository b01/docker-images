# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

# Build all the images. The order matters for app containers.

docker build --rm -t khalifahks/alpine-nginx ./alpine-nginx

docker build --rm -t khalifahks/alpine-memcached ./alpine-memcached

docker build --rm -t khalifahks/alpine-php --target base ./alpine-php

docker build --rm -t khalifahks/alpine-apps ./alpine-apps

docker build --rm -t khalifahks/alpine-cci ./alpine-cci

docker build --rm -t khalifahks/alpine-mongodb ./alpine-mongodb

docker build --rm -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support

