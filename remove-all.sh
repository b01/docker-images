#!/bin/bash

# This script removes all containers and associated images.

# Remove containers.
docker rm alpine-apps
docker rm alpine-php
docker rm alpine-nginx
docker rm alpine-mongodb

# Remove images.
docker rmi khalifahks/alpine-apps
docker rmi khalifahks/alpine-nginx
docker rmi khalifahks/alpine-php
docker rmi khalifahks/alpine-mongodb