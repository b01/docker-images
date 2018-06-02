FROM centos:centos7

# Other references:
# https://github.com/zokeber/docker-mongodb

# For details see:
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition
ADD mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo

# Import the GPG key
# Install MongoDB.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
 && yum -y update \
 && yum -y install mongodb-org \
 && yum clean all \
 && chown -R mongod:mongod /var/lib/mongo

USER mongod

VOLUME /var/lib/mongo
VOLUME /var/log/mongodb

ENV HOME /var/lib/mongo

WORKDIR /var/lib/mongo

ADD mongod.conf /etc/mongod.conf

EXPOSE 27017

# docker build -t khalifahks/centos-mongodb ./centos7-mongodb
# docker run -d --rm -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb
# docker run -d --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb

ENTRYPOINT ["/usr/bin/mongod"]
CMD ["-f", "/etc/mongod.conf"]