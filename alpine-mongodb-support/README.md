# MongoDB Support

Rolling backups of a database on a remote MongoDB instance

## Description

This Docker image provides a container to perform a backup of a database
on a remote MongoDB instance on a schedule.

Just pass the environment variable MONGO_NUM_BKUPS when starting a container with this image.

This was originally developed for taking backups of a MongoDB database running
in another container alongside it, for the purpose of development. So that a
developer could have a small local copy of data running in a real MongoDB
database, without having to share and program against ever-changing data.
As the developer made changes, they would automatically be backed up and easily
restored at anytime, even if the data volumes or container were removed.

You should be able to use this with just about any container running a Mongo DB
server. Just map the volumes of:
1. The MongoDB data files directory, serves as a link to your MongoDB container.
2. A volume mapped to your host computer where you want the backups stored.
   Ensure you map the volumes to persistent storage.

## Tools

A list of the MongoDB tools installed.

* mongodump
* mongoexport
* mongofiles
* mongoimport
* mongorestore
* mongostat
* mongotop

## Configuration

Before starting up the container, adjust the environment variables for
configuration.

```shell
MONGO_HOST: 'mongodb'
MONGO_USER: 'circleci'
MONGO_PASS: 'circleci123'
MONGO_ADMIN_DB: 'admin'
MONGO_DKR_DATA_DIR: '/var/lib/mongodb'
MONGO_DKR_BKUP_DIR: '/var/log/mongodb'
```

## How To Backup

Backups are done automatically using a crond job.

### Manual Backup

In case you need to.

```$xslt
docker exec -it alpine-mongodb-support backup-mongodb.sh
```

## How to Restore

To restore the most recent backup, run:

```
docker exec -it alpine-mongodb-support restore-last.sh
```

This method uses the credentials stored in the environment call.

## Build the Image and TestS

```shell
docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support
```

```shell
docker run --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support
```

## References:

* [docker-mongo-backup](https://github.com/reviewninja/docker-mongo-backup)
* [crontab-quick-reference](http://www.adminschoice.com/crontab-quick-reference)
* [how-to-run-a-cron-job-inside-a-docker-container](https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container)
* [mongo-tools](https://github.com/mongodb/mongo-tools)
* [TOOLS-2355](https://jira.mongodb.org/browse/TOOLS-2355)
* [gcc-cant-find-stdio-h-in-alpine-linux](https://stackoverflow.com/questions/42366739/gcc-cant-find-stdio-h-in-alpine-linux)
* [libpcap-dev](https://pkgs.alpinelinux.org/package/edge/main/x86/libpcap-dev)
