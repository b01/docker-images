#!/bin/bash

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mongodump -h Mongo

tar -zcvf "${BACKUP_DIR}/backup-${TIMESTAMP}.tar.gz" dump/

rm -rf dump/