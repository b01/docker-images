#!/bin/bash -e

# Build all the images. The order matters for app containers.

noCache=""
if [ -n "${1}" ]; then
    noCache=$1
fi

docker build --rm "${noCache}" -t khalifahks/centos-php ./centos7-php

docker build --rm "${noCache}" -t khalifahks/centos-php:54 ./centos7-php54

docker build --rm -t khalifahks/centos-apps ./apps

docker build --rm -t khalifahks/centos-apps:54 ./apps54

docker build --rm "${noCache}" -t khalifahks/centos-nginx ./centos7-nginx

docker build --rm "${noCache}" -t khalifahks/centos-memcached ./centos7-memcached

#docker build --rm "${noCache}" -t khalifahks/centos-mongodb ./centos7-mongodb

#docker build --rm "${noCache}" -t khalifahks/centos-mysql ./centos7-mysql