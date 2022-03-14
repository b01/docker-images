FROM khalifahks/alpine-glibc:2.34-r0 AS build

# Install MongoDB Build Requirements
# see: https://github.com/mongodb/mongo/blob/master/docs/building.md
# In order to build MongoDB, Python 3.7+ is required, and several Python modules must be installed.
# Note: In order to compile C-based Python modules, you'll also need the Python and OpenSSL C headers.
# Note: For C++ compilers that are newer than the supported version, the compiler may issue new warnings that cause
#       MongoDB to fail to build since the build system treats compiler warnings as errors. To ignore the warnings,
#       pass the switch --disable-warnings-as-errors to scons.
# Requirments not mentioned in the MongoDB install docs:
# * git, gcc, musl-dev (limits.h), linux-headers (version.h), g++, and xz-dev (lzma), curl
RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    curl-dev \
    g++ \
    gcc \
    git \
    libc-dev \
    linux-headers \
    musl-dev \
    python3 \
    python3-dev \
    openssl-dev \
    xz-dev \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

# Install Pytyon pip
RUN cd /tmp \
 && wget https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py

# Install MongoDB
# Options are:
# * install-mongod
# * install-mongos
# * install-mongo or install-shell
# * install-servers (includes mongod and mongos)
# * install-core (includes mongod, mongos, mongo)
# * install-all
ENV MONGODB_VER='5.0.6'

RUN cd /tmp \
 && git clone https://github.com/mongodb/mongo.git
#RUN cd /tmp \
# && git clone -b "r${MONGODB_VER}" --depth 1 https://github.com/mongodb/mongo.git
RUN cd /tmp/mongo \
 && python3 -m pip install --user -r etc/pip/compile-requirements.txt \
 && python3 buildscripts/scons.py install-mongod --disable-warnings-as-errors

ENV MONGO_DKR_DATA_DIR '/var/lib/mongodb'
ENV MONGO_DKR_LOG_DIR '/var/log/mongodb'
ENV ADD_USER_CMD "${MONGO_DKR_DATA_DIR}/add-user.sh"
ENV ADD_USER_FILE "${MONGO_DKR_DATA_DIR}/add-mongo-user.js"
ENV MONGO_RUN_PID_FILE '/var/run/mongodb/mongod.pid'

COPY mongod.conf /etc/
COPY add-user.sh "${MONGO_DKR_DATA_DIR}/"
COPY start-mongod.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start-mongod.sh \
 && mkdir -p /run/mongodb \
 && chown mongodb:mongodb /run/mongodb \
 && ln -sf /dev/stderr "${MONGO_DKR_LOG_DIR}/mongod.log" \
 && mongo -version

USER mongodb

VOLUME $MONGO_DKR_DATA_DIR

WORKDIR $MONGO_DKR_DATA_DIR

EXPOSE 27017

# docker build --rm --no-cache -t khalifahks/alpine-mongodb ./alpine-mongodb
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name alpine-mongodb -h alpine_mongodb khalifahks/alpine-mongodb
# docker exec -it alpine-mongodb mongo
# db.runCommand( { buildInfo: 1 } )

ENTRYPOINT []
CMD ["start-mongod.sh"]
