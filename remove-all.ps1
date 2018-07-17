# This script removes all containers and associated images.

# Remove containers.
docker rm alpine-nginx
docker rm alpine-memcached
docker rm alpine-cci
docker rm alpine-apps
docker rm alpine-php
docker rm alpine-mongodb
docker rm alpine-mongodb-support

# Remove images.
docker rmi khalifahks/alpine-nginx
docker rmi khalifahks/alpine-memcached
docker rmi khalifahks/alpine-cci
docker rmi khalifahks/alpine-apps
docker rmi khalifahks/alpine-php
docker rmi khalifahks/alpine-mongodb
docker rmi khalifahks/alpine-mongodb-support