<#
This script removes and build all images. See NOTES section on how to run.
#>

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