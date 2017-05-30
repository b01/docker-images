docker image prune -a
docker build -t khalifahks/area51:memcached ./centos7-memcached
docker build -t khalifahks/area51:mongodb ./centos7-mongodb
docker build -t khalifahks/area51:nginx ./centos7-nginx
docker build -t khalifahks/area51:php70 ./centos7-php
#docker build -t khalifahks/area51:web-app ./git-php-app
<#
To run this without enable Execution policy:
powershell -ExecutionPolicy bypass -File .\build-all.ps1
#>