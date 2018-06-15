FROM centos:centos7
# Provides centos7-mongodb-backup service for Mongo DB.

# References:
# https://github.com/reviewninja/docker-mongo-backup

# Install the latest EPEL release RPM.
# Then add the GPG keys to help verify packages and reduce errors(red) in the output.
# Update the system.
# Perform clean-up.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
 && yum -y update \
 && yum clean all

# Import the GPG key
# Install MongoDB.
RUN yum -y install cron \
 && yum clean all \
 && chown -R mongod:mongod /var/lib/mongo

USER mongod

ENV HOME /var/lib/mongo
ENV BACKUP_DIR /var/lib/mongo
ENV MONGO_LOGS /var/log/mongodb
ENV ADD_USER_CMD "${HOME}/add-user.sh"
ENV ADD_USER_FILE "${HOME}/add-mongo-user.js"
ENV MONGO_BAKUP_DAYS 10

VOLUME "${HOME}"
VOLUME "${ADD_USER_CMD}"
VOLUME "${BACKUP_DIR}"

WORKDIR $HOME

COPY backup.sh /bin/

# docker build --rm -t khalifahks/centos-mongodb-backup ./centos7-mongodb-backup
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' --name centos-mongodb-backup -h centos_mongodb_backup khalifahks/centos-mongodb-backup
# docker exec -it centos-mongodb-backup bash

ENTRYPOINT ["start-mongod.sh"]