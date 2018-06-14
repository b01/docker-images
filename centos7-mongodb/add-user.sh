#!/bin/bash -e

# Generate a password.
mongoUser="root"
mongoPass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mongoAdminDb="admin"

# Generate a script to add a user to Mongo DB.
x="use admin;\n"
x="${x}db.createUser({\n"
x="${x}    \"user\": \"${mongoUser}\",\n"
x="${x}    \"pwd\": \"${mongoPass}\",\n"
x="${x}    \"roles\": [{\n"
x="${x}       \"role\": \"root\",\n"
x="${x}        \"db\": \"${mongoAdminDb}\"\n"
x="${x}    }]\n"
x="${x}});"

# Save to a file.
printf "Generating script to add a root user.\n"
printf "${x}" > $ADD_USER_FILE

if [ -f "${ADD_USER_FILE}" ]; then
    # Start Mongo DB in the background.
    mongod --fork --port 27017 --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log --pidfilepath /var/run/mongodb/mongod.pid
    # ADD User.
    mongo < $ADD_USER_FILE
    # Without ths sleep there was an issue where the user was added
    # but then you could not use it to login. This was because the user
    # was added, but then before the data could be written to disk,
    # the process was killed.
    # So wait for some time to ensure the data is written to the database.
    sleep 2
    # Shutdown Mongo DB server.
    kill -9 `cat /var/run/mongodb/mongod.pid`
    # Remove the add user script.
    rm $ADD_USER_FILE
fi

# Display the generated account info.
y="Here is a Mongo DB generated account:\n"
y="This info will ONLY be shown ONCE, PLEASE write it down.\n"
y="${y}admin database: ${mongoAdminDb}\n"
y="${y}          user: ${mongoUser}\n"
y="${y}          pass: ${mongoPass}\n\n"
y="${y}How to use to login:\n"
y="${y}\tdocker exec -it centos-mongodb mongo -u ${mongoUser} -p ${mongoPass} --authenticationDatabase ${mongoAdminDb}\n\n"

printf "${y}"