FROM centos:centos7

# Install the lates MongoDB server.
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\

 && rpm --import \
      /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\
      /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\

 && yum -y update\
 && yum -y install mongodb-server\
 && yum clean all

# TODO: Map a volume outside this image
RUN mkdir -p /data/db

EXPOSE 27017

# docker run -d --rm -p 27017:27017 --name mongodb -h mongodb local:mongodb
# docker run -it --rm -p 27017:27017 --name mongodb -h mongodb local:mongodb
ENTRYPOINT ["/usr/bin/mongod"]