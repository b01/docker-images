#!/bin/sh

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mongodump -h $MONGO_HOST -u $MONGO_USER -p $MONGO_PASS --authenticationDatabase $MONGO_ADMIN_DB

tar -zcvf "${MONGO_DKR_BKUP_DIR}/backup-${TIMESTAMP}.tar.gz" dump/

rm -rf dump/

printf "Done.\n"