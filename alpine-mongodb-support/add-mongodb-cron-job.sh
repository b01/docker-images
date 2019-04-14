#!/bin/sh

set -e

echo "10 * * * * backup-mongodb.sh" > tmpcron

echo "15 * * * * truncate-mongodb-backups.sh" >> tmpcron

crontab tmpcron

rm -rf tmpcron

crontab -l