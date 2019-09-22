#!/bin/sh

# Because crond does not exit gracefully, we'll use to manage starting and stopping this container.

set -e

keepRunning=true
running=0

shutd () {
    # echo "Shutting down MongoDB Support cron job..." >&2
    printf "Shutting down MongoDB Support cron job..." >&2
    kill -9 `cat /var/run/crond.pid`
    keepRunning=false # set this to false to exit the loop we started earlier.
    printf "done.\n"
}

trap 'shutd' SIGTERM

echo "start.sh  Pid=$$"
echo "$$" > /var/run/start.pid

echo "starting MongDB support cron job, all interaction with the server will output below:"

# Start the cron job to take Mongo DB backups in the foreground to keep the container running.
# exec crond -f
crond

# Keep this script running in the foreground as PID 1.
while $keepRunning
do
    running=1
done

echo "exiting now."

exit 0
