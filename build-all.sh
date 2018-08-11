#!/usr/bin/env bash

# Build all the images. The order matters for app containers.
docker build --rm --no-cache -t khalifahks/alpine-nginx ./alpine-nginx

docker build --rm --no-cache -t khalifahks/alpine-memcached ./alpine-memcached

docker build --rm --no-cache -t khalifahks/alpine-php ./alpine-php

docker build --rm --no-cache -t khalifahks/alpine-apps ./alpine-apps

docker build --rm --no-cache -t khalifahks/alpine-cci ./alpine-cci

docker build --rm --no-cache -t khalifahks/alpine-mongodb ./alpine-mongodb

docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support