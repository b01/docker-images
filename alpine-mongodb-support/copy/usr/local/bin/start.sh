#!/bin/sh

# Because crond does not exit gracefully, we'll use this script to manage starting and stopping this container.

set -e

keepRunning=true
running=0

shutd () {
    # echo "Shutting down MongoDB Support cron job..." >&2
    printf "Shutting down MongoDB Support cron job process..."
    kill -9 `cat /var/run/crond.pid`
    keepRunning=false # set this to false to exit the loop we started earlier.
    printf "done.\n"
}

trap 'shutd' SIGTERM

# echo "start.sh  Pid=$$"
echo "$$" > /var/run/start.pid

echo "Starting MongDB support cron job, all interaction with the server will output below."

# Start the cron job in the background to take Mongo DB backups.
crond

# This loop will keep this script running in the foreground.
while $keepRunning
do
    running=1
done

echo "exiting now."

exit 0
