#!/bin/bash
#This Window 10+ script removes and build all images. See NOTES section on how to run.

# Remove associated containers.
docker rm centos-nginx centos-mongodb centos-memcached centos-php

# Remove any orphaned images.
docker image prune -a

# Build all the images. The order matters.
docker build -t khalifahks/centos-memcached ./centos7-memcached
docker build -t khalifahks/centos-mongodb ./centos7-mongodb
docker build -t khalifahks/centos-nginx ./centos7-nginx
docker build -t khalifahks/centos-php ./centos7-php
docker build -t khalifahks/centos-apps ./apps

# NOTES: See build-all.ps1 for command and hints.