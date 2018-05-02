#!/bin/bash

# This script removes and build all images. 

# Remove all associated containers.
docker rm centos-apps \
centos-apps54 \
centos-php \
centos-php54 \
centos-nginx \
centos-memcached \
centos-mysql \
centos-mongodb

# Remove all images.
docker rmi khalifahks/centos-apps
docker rmi khalifahks/centos-apps
docker rmi khalifahks/centos-apps:54
docker rmi khalifahks/centos-nginx
docker rmi khalifahks/centos-memcached
docker rmi khalifahks/centos-php
docker rmi khalifahks/centos-php:54
docker rmi khalifahks/centos-php:mysql
docker rmi khalifahks/centos-mongodb