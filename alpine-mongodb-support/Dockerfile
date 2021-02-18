# Provides backup support for a Mongodb instance running in a container.
FROM alpine:3.12

# References:
# https://github.com/reviewninja/docker-mongo-backup
# http://www.adminschoice.com/crontab-quick-reference

RUN apk --progress --purge --no-cache upgrade
# && apk --no-progress --purge --no-cache add --upgrade \
#    tini \
# && apk --progress --purge --no-cache upgrade \
# && rm -vrf /var/cache/apk/*
#
## Install MongoDB tools from source.
#RUN apk --no-progress --purge --no-cache add --upgrade --virtual buildtools \
#    bash \
#    cyrus-sasl-dev \
#    git \
#    go \
#    libc-dev \
#    libpcap-dev \
#    openssl-dev \
#    perl \
# && apk --progress --purge --no-cache upgrade \
# && go version \
# && export GOROOT='/usr/lib/go' \
# && mkdir -p "${GOROOT}"/src/github.com/mongodb \
# && cd "${GOROOT}"/src/github.com/mongodb \
# && git clone https://github.com/mongodb/mongo-tools.git \
# && cd mongo-tools \
# && ./build.sh ssl sasl \
# && cp "${GOROOT}"/src/github.com/mongodb/mongo-tools/bin/* /usr/local/bin/ \
# && rm -rf "${GOROOT}"/src \
# && apk del buildtools \
# && rm -vrf /var/cache/apk/*
#
#ENV MONGO_DKR_BKUP_DIR '/var/lib/mongodb-backup'
#ENV MONGO_NUM_BKUPS 10
#ENV MONGO_HOST 'localhost'
#ENV MONGO_USER ''
#ENV MONGO_PASS ''
#ENV MONGO_ADMIN_DB admin
#ENV MONGO_RUN_PID_FILE '/var/run/mongodb/mongod.pid'
#
#VOLUME $MONGO_DKR_BKUP_DIR
#
#COPY copy/. /
#
#RUN chmod +x /usr/local/bin/backup-mongodb.sh \
# && chmod +x /usr/local/bin/truncate-mongodb-backups.sh \
# && chmod +x /usr/local/bin/restore-last.sh \
# && chmod +x /usr/local/bin/start.sh \
# && crontab /crontabs/backup-crontab.txt
#
## docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support
## docker run --entrypoint=sh --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support
## docker exec -it alpine-mongodb-support sh
#
#ENTRYPOINT [ "sh" ]
#
#CMD [ "/usr/local/bin/start.sh" ]
