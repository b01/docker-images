FROM centos:centos7
# Provides Mongo DB as a service.
# You MUST what the log output when you first run this image. The reason is that a root account will be generated and displayed, but only the first time the image is run. Once the container is restarted it will NOT be displayed again. However you can recover it by:
# 1. Run the image and log into the container and restart the MongoDB server without authentication enabled.
# 2. Delete the "/var/lib/mongo" volume and start the run the image again, in which case a new data file will be made and a new account generated.
# For these reasons its especially important to backup the account once it is displayed and/or to replace/make additional accounts once you can successfully login.
#
# Its also a best practice to use a backup container to automate the backup process of your databases or data files. That should also include the logs since logs can be very helpful when there is a problem with the data. This image will place logs in the volume "/var/log/mongodb".

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
ENV ADD_USER_CMD "${HOME}/add-user.sh"
ENV ADD_USER_FILE "${HOME}/add-mongo-user.js"
ENV MONGO_CRED_FILE "${HOME}/mongo-credentials.txt"

WORKDIR $HOME

COPY mongod.conf /etc/
COPY add-user.sh "${HOME}/"
COPY start-mongod.sh /bin/

EXPOSE 27017

# docker build --rm -t khalifahks/centos-mongodb ./centos7-mongodb
# docker run -d --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name centos-mongodb -h centos_mongodb khalifahks/centos-mongodb
# docker exec -it centos-mongodb mongo

ENTRYPOINT ["start-mongod.sh"]