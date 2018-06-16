# Docker image to back up a running MongoDB instance

## Description
Rolling backups of a MongoDB instance over x amount of days.

Just pass the environment variable MONGO_BAKUP_DAYS when starting a container with this image.

This is assuming another container is running MongoDB with external volumes, one for data and another for logging.
The names of these containers should not matter since you will link 
via "named" volumes. See below.

# How To
You should be able to use this with just about any container running a Mongo DB server. Just map the volumes of:
1. The MongoDB data files directory.
2. The MongoDB log files directory.
3. A volume mapped to your host computer where you want the backups stored.

Numbers 1,2 serve as the link to your MongoDB container. While 3 servers as the link to download the backups to your
host computer.