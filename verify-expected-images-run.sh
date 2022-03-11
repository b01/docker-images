#!/bin/sh

set -e

missingContainers=""

cNames="alpine-nginx
alpine-cci
alpine-mongodb"
#alpine-mongodb-support"

for name in ${cNames}
do
    containerId=$(docker ps -f "name=${name}" -f "status=running" -q)

    if [ -z "${containerId}" ]; then
        echo "Did NOT find ${name} running."
        missingContainers="${missingContainers} ${name}"
    fi
done

if [ -n "${missingContainers}" ]; then
    echo "Could NOT find the following containers running: ${missingContainers}"
    exit 1
fi

echo "All test passed."