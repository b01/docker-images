#!/bin/sh

shutd () {
    echo "Shutting down MongoDB..." >&2
    mongod --config /etc/mongod.conf --shutdown
    exit
}
trap 'shutd' SIGTERM

printf "running as user " && whoami

echo "start-mongod.sh  Pid=$$"

# Run script to add a root user with a generated password.
echo "add user file: ${ADD_USER_CMD}"
if [ -f "${ADD_USER_CMD}" ]; then
    printf "running ${ADD_USER_CMD} script\n\n"
    source $ADD_USER_CMD
    rm -v $ADD_USER_CMD
fi

printf "starting mongod, all interaction with the server will output below:\n" && whoami

# Start the mongo server in the foreground to keep the container running.
exec mongod --config /etc/mongod.conf