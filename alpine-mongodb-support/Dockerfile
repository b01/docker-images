# Provides backup support for a Mongodb instance running in a container.

ARG USER_NAME="tool"
ARG USER_UID="1000"
ARG USER_GID="1000"
ARG USER_GROUP="tool_users"

FROM khalifahks/alpine-glibc:2.34-r0 AS base

RUN apk --no-progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    ca-certificates \
    curl \
    jq \
    krb5-dev \
    openssh \
 && apk --no-progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/* \
 && cd /tmp rm -rf *

# START NEW BUILD STAGE
FROM base AS build
# References:
# https://github.com/reviewninja/docker-mongo-backup
# http://www.adminschoice.com/crontab-quick-reference

#ENV GOPATH="/home/${USER_NAME}"
#ENV PATH="/home/${USER_NAME}/bin:${PATH}"
#ENV WORK_DIR="/home/${USER_NAME}/src/github.com"

# Install MongoDB tools from source.
RUN apk --no-progress --purge --no-cache add --upgrade --virtual buildtools \
    cyrus-sasl-dev \
    git \
    go \
    libc-dev \
    libpcap-dev \
    openssl-dev \
    perl \
 && apk --progress --purge --no-cache upgrade

RUN mkdir -p ~/src/github.com \
 && cd ~/src/github.com \
 && export CGO_ENABLED=1 \
 && git clone https://github.com/mongodb/mongo-tools.git \
 && cd mongo-tools \
 && go mod vendor \
 && go mod tidy \
 && ./make build \
 && cp ~/src/github.com/mongo-tools/bin/* /usr/local/bin/

RUN apk --no-progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade --virtual .build-deps \
    make \
 && apk --no-progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/* \
 && cd /tmp rm -rf *

# Download and install MongoDB CLI
RUN git clone https://github.com/mongodb/mongocli.git \
 && cd mongocli \
 && make install

RUN rm -rf ~/src \
 && apk del buildtools \
 && rm -vrf /var/cache/apk/*

# START NEW BUILD STAGE
FROM base AS release

ENV MONGO_DKR_BKUP_DIR '/var/lib/mongodb-backup'
ENV MONGO_NUM_BKUPS 10
ENV MONGO_HOST 'localhost'
ENV MONGO_USER ''
ENV MONGO_PASS ''
ENV MONGO_ADMIN_DB admin
ENV MONGO_RUN_PID_FILE '/var/run/mongodb/mongod.pid'

VOLUME ${MONGO_DKR_BKUP_DIR}

COPY --from=build /usr/local/bin/ /usr/local/bin/
COPY --from=build /root/go/bin/ /usr/local/bin/

COPY copy/. /

RUN chmod +x /usr/local/bin/backup-mongodb.sh \
 && chmod +x /usr/local/bin/truncate-mongodb-backups.sh \
 && chmod +x /usr/local/bin/restore-last.sh \
 && chmod +x /usr/local/bin/start.sh \
 && crontab /crontabs/backup-crontab.txt

RUN ls -la /usr/local/bin

ENTRYPOINT [ "sh" ]

CMD [ "/usr/local/bin/start.sh" ]
