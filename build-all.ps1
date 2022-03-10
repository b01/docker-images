# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

# Build all the images. The order matters for app containers.

docker build --rm -t khalifahks/alpine-nginx ./alpine-nginx

docker build --rm -t khalifahks/alpine-cci ./alpine-cci

docker build --rm -t khalifahks/alpine-cci ./alpine-glibc

docker build --rm -t khalifahks/alpine-mongodb ./alpine-mongodb

docker build --rm -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support

