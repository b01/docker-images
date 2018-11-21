#!/bin/sh

set -e

cd "${MONGO_DKR_BKUP_DIR}"

restoreDir="${MONGO_DKR_BKUP_DIR}/restore"
lastBackup=$(ls -t|head -n "1")

if [ -z "${user}" ]; then
    user="${MONGO_USER}"
fi

if [ -z "${pass}" ]; then
    pass="${MONGO_PASS}"
fi

if [ -z "${adminDb}" ]; then
    adminDb="${MONGO_ADMIN_DB}"
fi

printf "Restoring database from ${lastBackup}\n"

rm -rf  "${restoreDir}"

mkdir -p "${restoreDir}"

tar -xvf "./${lastBackup}" -C "${restoreDir}"

mongorestore -h "${MONGO_HOST}" -u "${user}" -p "${pass}" --authenticationDatabase "${adminDb}" "${restoreDir}/dump"

rm -rf  "${restoreDir}"

printf " done."