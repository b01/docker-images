#!/bin/sh -e

# Get root user
if [ -n "${MONGO_USER}" ]; then
    mongoUser="${MONGO_USER}"
else
    mongoUser="root"
fi

# Get a password.
if [ -n "${MONGO_PASS}" ]; then
    mongoPass="${MONGO_PASS}"
else
    mongoPass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
fi

# Get admin database.
if [ -n "${MONGO_ADMIN_DB}" ]; then
    mongoAdminDb="${MONGO_ADMIN_DB}"
else
    mongoAdminDb="admin"
fi

# Generate a script to add a user to Mongo DB.
x="use admin;\n"
x="${x}db.createUser({\n"
x="${x}    \"user\": \"${mongoUser}\",\n"
x="${x}    \"pwd\": \"${mongoPass}\",\n"
x="${x}    \"roles\": [\n"
x="${x}        { \"role\": \"root\", \"db\": \"${mongoAdminDb}\" },\n"
x="${x}        { \"role\": \"userAdminAnyDatabase\", \"db\": \"${mongoAdminDb}\" },\n"
x="${x}        { \"role\": \"restore\", \"db\": \"${mongoAdminDb}\"}\n"
x="${x}    ]\n"
x="${x}});"

# Save to a file.
printf "Generating script to add a root user.\n"
printf "${x}" > $ADD_USER_FILE

if [ -f "${ADD_USER_FILE}" ]; then
    # Start Mongo DB in the background.
    mongod --fork --port 27017 --dbpath "${MONGO_DKR_DATA_DIR}" --logpath "${MONGO_DKR_LOG_DIR}"/mongod.log --pidfilepath "${MONGO_RUN_PID_FILE}"
    # ADD User.
    mongo < $ADD_USER_FILE
    # Shutdown Mongo DB server.
    mongod --shutdown --dbpath "${MONGO_DKR_DATA_DIR}"
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
y="${y}\tdocker exec -it alpine-mongodb mongo -u ${mongoUser} -p ${mongoPass} --authenticationDatabase ${mongoAdminDb}\n\n"

printf "${y}"