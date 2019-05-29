FROM alpine:3.9
# Provides backup support for a Mongodb instance running in a container.

# References:
# https://github.com/reviewninja/docker-mongo-backup
# http://www.adminschoice.com/crontab-quick-reference

# Install MongoDB tools and crond.
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    mongodb-tools \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

ENV MONGO_DKR_DATA_DIR /var/lib/mongodb
ENV MONGO_DKR_BKUP_DIR /var/lib/mongodb-backup
ENV MONGO_NUM_BKUPS 10
ENV MONGO_HOST 'localhost'
ENV MONGO_USER ''
ENV MONGO_PASS ''
ENV MONGO_ADMIN_DB admin
ENV MONGO_RUN_PID_FILE '/var/run/mongodb/mongod.pid'

VOLUME $MONGO_DKR_DATA_DIR
VOLUME $MONGO_DKR_BKUP_DIR

WORKDIR $MONGO_DKR_DATA_DIR

COPY backup-mongodb.sh /usr/local/bin/
COPY truncate-mongodb-backups.sh /usr/local/bin/
COPY add-mongodb-cron-job.sh /usr/local/bin/
COPY restore-last.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/backup-mongodb.sh \
 && chmod +x /usr/local/bin/truncate-mongodb-backups.sh \
 && chmod +x /usr/local/bin/add-mongodb-cron-job.sh \
 && chmod +x /usr/local/bin/restore-last.sh \
 && add-mongodb-cron-job.sh

# docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support
# docker run --entrypoint=sh --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support

ENTRYPOINT ["crond"]

CMD ["start", "-f"]