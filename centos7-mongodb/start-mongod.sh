#!/bin/bash -e

# Run script to add a root user with a generated password.
if [ -f "${ADD_USER_CMD}" ]; then
    printf "running ${ADD_USER_CMD} script\n\n"
    source $ADD_USER_CMD
fi

# Start the mongo server in the foreground to keep the container running.
mongod --config /etc/mongod.conf