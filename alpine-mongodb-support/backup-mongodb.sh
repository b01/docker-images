#!/bin/sh

set -e

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mongodump --version
mongodump -vvvv -h $MONGO_HOST -u $MONGO_USER -p $MONGO_PASS --authenticationDatabase $MONGO_ADMIN_DB

file="${MONGO_DKR_BKUP_DIR}/backup-${TIMESTAMP}.tar.gz"
tar -zcvf $file dump/

echo "Backup ${file} made at ${TIMESTAMP}" >> "${MONGO_DKR_BKUP_DIR}"/backup.log

if [ -d "${MONGO_DKR_BKUP_DIR}/dump" ]; then
    printf "Removing dump dir...\n"
    rm -rf "${MONGO_DKR_BKUP_DIR}/dump"
fi

printf "Done.\n"