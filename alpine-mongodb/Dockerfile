FROM alpine:edge
# Provides Mongo DB as a service.
# You MUST view the log output when you first run this image. The reason is that a root account will be generated and displayed, but only the first time the image is run. Once the container is restarted it will NOT be displayed again. However you can recover it by:
# 1. Run the image and log into the container and restart the MongoDB server without authentication enabled.
# 2. Delete the "/var/lib/mongo" volume and start the run the image again, in which case a new data file will be made and a new account generated.
# For these reasons its especially important to backup the account once it is displayed and/or to replace/make additional accounts once you can successfully login.
#
# Its also a best practice to use a backup container to automate the backup process of your databases or data files. That should also include the logs since logs can be very helpful when there is a problem with the data. This image will place logs in the volume "/var/log/mongodb".

# References:
# https://github.com/zokeber/docker-mongodb
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition

# Install MongoDB.
RUN apk --update add --no-cache \
    mongodb

ENV HOME /var/lib/mongodb
ENV ADD_USER_CMD "${HOME}/add-user.sh"
ENV ADD_USER_FILE "${HOME}/add-mongo-user.js"

COPY mongod.conf /etc/
COPY add-user.sh "${HOME}/"
COPY start-mongod.sh /usr/bin/

RUN chmod +x /usr/bin/start-mongod.sh \
 && chown mongodb:mongodb "${HOME}/add-user.sh" \
 && mkdir -p /run/mongodb \
 && chown mongodb:mongodb /run/mongodb

USER mongodb

VOLUME /var/lib/mongodb
VOLUME /var/log/mongodb

WORKDIR $HOME

EXPOSE 27017

# docker build --rm --no-cache -t khalifahks/alpine-mongodb ./alpine-mongodb
# docker run -d --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name alpine-mongodb -h alpine_mongodb khalifahks/alpine-mongodb
# docker run --rm --mount 'src=mongoData,dst=/var/lib/mongo' --mount 'src=mongoLog,dst=/var/log/mongodb' -p 27017:27017 --name alpine-mongodb -h alpine_mongodb khalifahks/alpine-mongodb
# docker exec -it alpine-mongodb mongo

ENTRYPOINT ["start-mongod.sh"]