docker image prune -a
docker build -t khalifahks/area51:memcached ./centos7-memcached
docker build -t khalifahks/area51:mongodb ./centos7-mongodb
docker build -t khalifahks/area51:nginx ./centos7-nginx
docker build -t khalifahks/area51:php70 ./centos7-php
docker build -t khalifahks/area51:web-app ./git-php-app
<#
To run this without enable Execution policy:
powershell -ExecutionPolicy bypass -File .\build-all.ps1

Remove containers
docker rm area51_nginx_1 area51_stock_mongo_1 area51_memcached_1 area51_php_fpm_70_1

Remove images (make sure you remove any containers that use them.)
docker rmi khalifahks/area51:nginx
docker rmi khalifahks/area51:php70

To publish images
docker push khalifahks/area51:memcached
docker push khalifahks/area51:nginx
docker push khalifahks/area51:php70
#>