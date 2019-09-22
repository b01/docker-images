FROM alpine:3.9
# Provides backup support for a Mongodb instance running in a container.

# References:
# https://github.com/reviewninja/docker-mongo-backup
# http://www.adminschoice.com/crontab-quick-reference
# https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container
# https://github.com/mongodb/mongo-tools
# https://jira.mongodb.org/browse/TOOLS-2355
# https://stackoverflow.com/questions/42366739/gcc-cant-find-stdio-h-in-alpine-linux
# https://pkgs.alpinelinux.org/package/edge/main/x86/libpcap-dev

RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    tini \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

# Install MongoDB tools since non in Alpine packages.
RUN apk --no-progress --purge --no-cache add --upgrade --virtual buildtools \
    bash \
    git \
    go \
    libc-dev \
    libpcap-dev \
    perl \
 && apk --progress --purge --no-cache upgrade \
 && go version \
 && export GOROOT='/usr/lib/go' \
 && mkdir -p "${GOROOT}"/src/github.com/mongodb \
 && cd "${GOROOT}"/src/github.com/mongodb \
 && git clone https://github.com/mongodb/mongo-tools.git \
 && cd mongo-tools \
 && ./build.sh \
 && apk del buildtools \
 && rm -vrf /var/cache/apk/*

ENV MONGO_DKR_BKUP_DIR '/var/lib/mongodb-backup'
ENV MONGO_NUM_BKUPS 10
ENV MONGO_HOST 'localhost'
ENV MONGO_USER ''
ENV MONGO_PASS ''
ENV MONGO_ADMIN_DB admin
ENV MONGO_RUN_PID_FILE '/var/run/mongodb/mongod.pid'

VOLUME $MONGO_DKR_BKUP_DIR

COPY copy/. /

RUN chmod +x /usr/local/bin/backup-mongodb.sh \
 && chmod +x /usr/local/bin/truncate-mongodb-backups.sh \
 && chmod +x /usr/local/bin/restore-last.sh \
 && crontab /crontabs/backup-crontab.txt

# docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support

ENTRYPOINT [ "tini", "--" ]

CMD [ "crond", "-f" ]
