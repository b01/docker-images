docker image prune -a
docker build -t khalifahks/area51:memcached ./centos7-memcached
docker build -t khalifahks/area51:mongodb ./centos7-mongodb
docker build -t khalifahks/area51:nginx ./centos7-nginx
docker build -t khalifahks/area51:php70 ./centos7-php
docker build -t local:web-app ./git-php-app