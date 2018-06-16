#!/bin/bash

touch tmpcron

echo "0 2 * * * /mongodb-backup.sh" >> tmpcron

echo "0 5 * * * /remove.sh" >> tmpcron

crontab tmpcron

rm tmpcron