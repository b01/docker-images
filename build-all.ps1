
# Build all the images. The order matters.

docker build --rm --no-cache -t khalifahks/centos-php ./centos7-php

docker build --rm -t khalifahks/centos-php:54 ./centos7-php54

docker build --rm -t khalifahks/centos-memcached ./centos7-memcached

docker build --rm -t khalifahks/centos-mongodb ./centos7-mongodb

docker build --rm -t khalifahks/centos-mysql ./centos7-mysql

docker build --rm -t khalifahks/centos-nginx ./centos7-nginx

docker build --rm -t khalifahks/centos-apps ./apps

docker build --rm -t khalifahks/centos-apps:54 ./apps54
<#
NOTES:

**To run this without enable Execution policy:**

```bash
powershell -ExecutionPolicy bypass -File .\build-all.ps1
```

**Remove containers**
```bash
docker rm centos-nginx centos-mongodb centos-memcached centos-php
```

**Remove images (make sure you remove any containers that use them.)**
```bash
docker rmi khalifahks/centos-nginx
docker rmi khalifahks/centos-php
```

**Command to publish individual images**
```
docker push khalifahks/centos-apps
docker push khalifahks/centos-memcached
docker push khalifahks/centos-nginx
docker push khalifahks/centos-php
```
#>