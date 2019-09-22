# Docker image to back up a running MongoDB instance

## Description

Rolling backups of a MongoDB instance over x amount of days.

Just pass the environment variable MONGO_NUM_BKUPS when starting a container with this image.

This is assuming another container is running MongoDB with external volumes, one for data and another for logging.
The names of these containers should not matter since you will link
via "named" volumes. See below.

You should be able to use this with just about any container running a Mongo DB server. Just map the volumes of:
1. The MongoDB data files directory.
2. A volume mapped to your host computer where you want the backups stored.

Number 1 serves as a link to your MongoDB container. While 3 servers as the link to download the backups to your
host computer.

## How To Backup

Backups are done automatically using a crond job.

To backup manually

```$xslt
docker exec -it alpine-mongodb-support backup-mongodb.sh
```

This method uses the credentials stored in the environment call.

## How to Restore

To restore the most recent backup, run:

```
docker exec -it alpine-mongodb-support restore-last.sh
```

This method uses the credentials stored in the environment call.

## Build the Image and TestS

`docker build --rm --no-cache -t khalifahks/alpine-mongodb-support ./alpine-mongodb-support`
`docker run --rm --mount 'src=mongoData,dst=/var/lib/mongodb' --mount 'src=mongoLog,dst=/var/log/mongodb' --name alpine-mongodb-support -h alpine_mongodb_support khalifahks/alpine-mongodb-support`

## References:

* [docker-mongo-backup](https://github.com/reviewninja/docker-mongo-backup)
* [crontab-quick-reference](http://www.adminschoice.com/crontab-quick-reference)
* [how-to-run-a-cron-job-inside-a-docker-container](https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container)
* [mongo-tools](https://github.com/mongodb/mongo-tools)
* [TOOLS-2355](https://jira.mongodb.org/browse/TOOLS-2355)
* [gcc-cant-find-stdio-h-in-alpine-linux](https://stackoverflow.com/questions/42366739/gcc-cant-find-stdio-h-in-alpine-linux)
* [libpcap-dev](https://pkgs.alpinelinux.org/package/edge/main/x86/libpcap-dev)
