#!/bin/bash -e

# Build all the images. The order matters for app containers.

docker build --rm -t khalifahks/alpine-nginx ./alpine-nginx

docker build --rm -t khalifahks/alpine-php ./alpine-php

docker build --rm -t khalifahks/alpine-apps ./alpine-apps

#docker build --rm -t khalifahks/alpine-cci cci

docker build --rm -t khalifahks/alpine-mongodb ./alpine-mongodb