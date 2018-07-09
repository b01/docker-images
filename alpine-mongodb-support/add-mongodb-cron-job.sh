#!/bin/sh -e

echo "0 2 * * * /backup-mongodb.sh" > tmpcron

echo "0 5 * * * /truncate-mongodb-backups.sh" >> tmpcron

crontab tmpcron

rm tmpcron