#!/bin/bash

# exit on error.
set -e

# Build all the images. The order matters.

printf "\n\nBuilding php\n";
docker build --rm --no-cache -t khalifahks/centos-php ./centos7-php

printf "\n\nBuilding php v5.4\n";
docker build --rm -t khalifahks/centos-php:54 ./centos7-php54

printf "\n\nBuilding memcached\n";
docker build --rm -t khalifahks/centos-memcached ./centos7-memcached

printf "\n\nBuilding mongodb\n";
docker build --rm -t khalifahks/centos-mongodb ./centos7-mongodb

printf "\n\nBuilding mysql\n";
docker build --rm -t khalifahks/centos-mysql ./centos7-mysql

printf "\n\nBuilding nginx\n";
docker build --rm -t khalifahks/centos-nginx ./centos7-nginx

printf "\n\nBuilding apps\n";
docker build --rm -t khalifahks/centos-apps ./apps

printf "\n\nBuilding apps:54\n";
docker build --rm -t khalifahks/centos-apps:54 ./apps54