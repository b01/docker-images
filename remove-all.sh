#!/bin/bash

# This script removes all containers and associated images.

# Remove containers.
docker rm alpine-nginx
docker rm alpine-cci
docker rm alpine-glibc
docker rm alpine-mongodb
docker rm alpine-mongodb-support

# Remove images.
docker rmi khalifahks/alpine-nginx
docker rmi khalifahks/alpine-cci
docker rmi khalifahks/alpine-glibc
docker rmi khalifahks/alpine-mongodb
docker rmi khalifahks/alpine-mongodb-support