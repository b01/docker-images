FROM centos:centos7

# For details see:
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition
ADD ./mongodb-34-org.repo /etc/yum.repos.d/mongodb-34-org.repo

# Import the GPG key
# Install MongoDB.
RUN rpm --import https://www.mongodb.org/static/pgp/server-3.4.asc\

 && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\

 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\

 && yum -y update\
 && yum -y install mongodb-org\
 && yum clean all

ADD ./mongodb-34.conf /etc/mongod.conf

EXPOSE 27017

# docker run -d --rm -p 27017:27017 --name mongodb -h mongodb khalifahks/area51:mongodb
# docker run -it --rm -p 27017:27017 --name mongodb -h mongodb khalifahks/area51:mongodb
ENTRYPOINT ["/usr/bin/mongod"]