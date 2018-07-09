#!/bin/sh

cd "${MONGO_DKR_BKUP_DIR}"

# Only keep the last 10 backups.
(ls -t|head -n "${MONGO_BAKUP_DAYS}";ls)|sort|uniq -u|xargs rm