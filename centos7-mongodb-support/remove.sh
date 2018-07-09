#!/bin/bash

# Keep only the X number of backups.
cd "${MONGO_BACKUP_DIR}"
(ls -t|head -n "${MONGO_BAKUP_DAYS}";ls)|sort|uniq -u|xargs rm
cd /