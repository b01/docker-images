#!/bin/sh

set -e

cd "${MONGO_DKR_BKUP_DIR}"

# Get a sorted list of backup files in the backup directory.
truncateFile="${MONGO_DKR_BKUP_DIR}"/rm-backup.txt

ls -lt "${MONGO_DKR_BKUP_DIR}"/backup*.tar.gz > "${truncateFile}"
echo "" >> "${truncateFile}"

i=0
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

while read line; do
    i=$((i+1))

    file=$(echo $line | sed -E 's/[^/]+(.*)/\1/')

    if [ -n "${file}" ] && [ $i -gt $MONGO_NUM_BKUPS ]; then
        echo "removing backup \"${file}\""
        rm -v "${file}"

        if [ ! -f "${file}" ]; then
            echo "removed backup ${file} at ${TIMESTAMP}" >> "${MONGO_DKR_BKUP_DIR}"/backup.log
        fi
    fi
done < "${truncateFile}"

rm "${truncateFile}"
