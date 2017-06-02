#!/bin/bash
#This Window 10+ script removes and build all images. See NOTES section on how to run.

# Remove associated containers.
docker rm area51_nginx_1 area51_stock_mongo_1 area51_memcached_1 area51_php_fpm_70_1

# Remove any orphaned images.
docker image prune -a

# Build all the images. The order matters.
docker build -t khalifahks/area51:memcached ./centos7-memcached
docker build -t khalifahks/area51:mongodb ./centos7-mongodb
docker build -t khalifahks/area51:nginx ./centos7-nginx
docker build -t khalifahks/area51:php70 ./centos7-php
docker build -t khalifahks/area51:apps ./apps

# NOTES: See build-all.ps1 for command and hints.