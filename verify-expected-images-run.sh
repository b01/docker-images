#!/usr/bin/env sh

cNames="alpine-nginx"
cNames="${cNames} alpine-memcached"
cNames="${cNames} alpine-apps"
cNames="${cNames} alpine-cci"
cNames="${cNames} alpine-mongodb"
cNames="${cNames} alpine-mongodb-support"
missingContainers=""

for name in $cNames
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