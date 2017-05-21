docker image prune -a
docker build -t local:memcached ./centos7-memcached
docker build -t local:mongodb ./centos7-mongodb
docker build -t local:nginx ./centos7-nginx
docker build -t local:php70 ./centos7-php
docker build -t local:web-app ./git-php-app