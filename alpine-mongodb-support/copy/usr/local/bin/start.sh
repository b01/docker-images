#!/bin/sh

# Because crond does not exit gracefully, we'll use this script to manage starting and stopping this container.

set -e

shutd () {
    printf "Shutting down MongoDB Support cron job process..."
    kill -9 `cat /var/run/crond.pid`
    printf "done.\n"
}

echo "Starting up..."

trap 'shutd' SIGTERM

# echo "start.sh  Pid=$$"
echo "$$" > /var/run/start.pid

echo "Starting MongoDB support cron job, all interaction with the server will output below."

# Start the cron job in the background to take Mongo DB backups.
crond

# Keep the container running until it receives a sign to be stopped
# Also very low CPU usage.
while :; do :; done & kill -STOP $! && wait $!

echo "exiting now."
