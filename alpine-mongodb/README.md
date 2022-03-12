# MongoDB

Mongo DB Community Edition Docker image, installed from source on Alpine.

You MUST view the log output when you first run this image. The reason is that
a root account will be generated and displayed, but only the first time the
container is run (unless you delete the external volume). Once the container
is restarted it will NOT be displayed again. However, you can recover it by:

1. Run the image and log into the container and restart the MongoDB server
   without authentication enabled.
2. Delete the "/var/lib/mongo" volume and start the run the image again, in
   which case a new data file will be made and a new account generated.
For these reasons it is especially important to back-up the account once it is
displayed and/or to replace/make additional accounts once you can successfully
log in.

It's also a good practice to use a backup container to automate the backup
process of your databases or data files to persistent store on the host machine
or elsewhere. That should also include the logs since logs can be very helpful
when there is a problem with the data. This image will place logs in the
volume "/var/log/mongodb".

## References

* https://github.com/zokeber/docker-mongodb
* https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition
