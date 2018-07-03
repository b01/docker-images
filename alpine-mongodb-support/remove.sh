#!/bin/sh

# I think this make is so that only the last 10 backup are kept.
# Keep only the last 10 backups???
cd "${MONGO_BACKUP_DIR}" \
&& (ls -t|head -n "${MONGO_BAKUP_DAYS}";ls)|sort|uniq -u|xargs rm
cd /