#!/bin/sh

set -e

# Build all the images.
dockerImages="alpine-nginx
alpine-cci
alpine-glibc
alpine-mongodb
alpine-mongodb-support"

for dockerImage in ${dockerImages}
do
    echo "Building ${dockerImage}"
    docker build --rm --no-cache -t khalifahks/"${dockerImage}" ./"${dockerImage}"
done
