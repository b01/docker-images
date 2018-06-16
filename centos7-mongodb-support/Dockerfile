FROM centos:centos7
# Provides centos7-mongodb-support service for Mongo DB.

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

ADD mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo

# Install MongoDB tools and crond.
RUN yum-config-manager --enable mongodb-org-3.6 \
 && yum -y update \
 && yum -y install cronie mongodb-org-tools \
 && yum clean all

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

# docker build --rm -t khalifahks/centos-mongodb-support ./centos7-mongodb-support
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' --name centos-mongodb-support -h centos_mongodb_support khalifahks/centos-mongodb-support
# docker exec -it centos-mongodb-support bash

ENTRYPOINT ["crond"]

CMD ["start", "-n"]