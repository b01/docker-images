FROM centos:centos7

# References:
# https://github.com/zokeber/docker-mongodb
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition

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

# Import the GPG key
# Install MongoDB.
RUN yum-config-manager --enable mongodb-org-3.6 \
 && yum -y update \
 && yum -y install mongodb-org \
 && yum clean all \
 && chown -R mongod:mongod /var/lib/mongo

USER mongod

VOLUME /var/lib/mongo
VOLUME /var/log/mongodb

ENV HOME /var/lib/mongo
ENV ADD_USER_CMD /bin/add-user.sh
ENV ADD_USER_FILE "${HOME}/add-mongo-user.js"
ENV MONGO_CRED_FILE "${HOME}/mongo-credentials.txt"

WORKDIR $HOME

COPY mongod.conf /etc/mongod.conf
COPY add-user.sh /bin/add-user.sh
COPY start-mongod.sh /bin/start-mongod.sh

EXPOSE 27017

# docker build --rm -t khalifahks/centos-mongodb ./centos7-mongodb
# docker run -d --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb
# docker exec -it centos-mongodb mongo

ENTRYPOINT ["start-mongod.sh"]