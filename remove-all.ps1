# This script removes and build all images.

# Remove all associated containers.
docker rm centos-apps
docker rm centos-apps54
docker rm centos-php
docker rm centos-php54
docker rm centos-nginx
docker rm centos-memcached
docker rm centos-mysql
docker rm centos-mongodb

# Then remove all images.
docker rmi khalifahks/centos-apps
docker rmi khalifahks/centos-apps:54
docker rmi khalifahks/centos-php
docker rmi khalifahks/centos-php:54
docker rmi khalifahks/centos-mysql
docker rmi khalifahks/centos-nginx
docker rmi khalifahks/centos-mongodb
docker rmi khalifahks/centos-memcached