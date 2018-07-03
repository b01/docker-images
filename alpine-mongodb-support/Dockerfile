FROM alpine:edge
# Provides backup support for a Mongodb instance running in a container.

# References:
# https://github.com/reviewninja/docker-mongo-backup

# Install MongoDB tools and crond.
RUN apk --update add --no-cache \
 mongodb-tools

ENV HOME /var/lib/mongo
ENV MONGO_BACKUP_DIR /var/lib/mongodb-backup
ENV MONGO_LOGS /var/log/mongodb
ENV MONGO_BAKUP_DAYS 10
ENV MONGO_HOST "localhost"
ENV MONGO_USER ""
ENV MONGO_PASS ""
ENV MONGO_ADMIN_DB admin

VOLUME $HOME
VOLUME $MONGO_BACKUP_DIR
VOLUME $MONGO_LOGS

WORKDIR $HOME

COPY mongodb-backup.sh /bin/
COPY remove.sh /bin/
COPY start-cron-job.sh /bin/

RUN chmod +x /bin/mongodb-backup.sh \
 && chmod +x /bin/remove.sh \
 && chmod +x /bin/start-cron-job.sh

RUN start-cron-job.sh

# docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support
# docker exec -it alpine-mongodb-support sh

ENTRYPOINT ["crond"]

CMD ["start", "-f"]