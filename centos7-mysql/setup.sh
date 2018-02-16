log "info" "Creating empty data directory in: ${DB_DATA_DIR}."
run "mkdir -p ${DB_DATA_DIR}"
run "chown -R ${MY_USER}:${MY_GROUP} ${DB_DATA_DIR}"
run "chmod 0777 ${MY_USER}:${MY_GROUP} ${DB_DATA_DIR}"

### MySQL Password Options
###
if ! set | grep '^MYSQL_ROOT_PASSWORD=' >/dev/null 2>&1; then
    log "err" "\$MYSQL_ROOT_PASSWORD must be set."
    exit 1
fi

log "info" "Setting up root user permissions."
echo "DELETE FROM mysql.user ;" | mysql --protocol=socket -uroot
echo "CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" | mysql --protocol=socket -uroot
echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;" | mysql --protocol=socket -uroot
echo "DROP DATABASE IF EXISTS test ;" | mysql --protocol=socket -uroot
echo "FLUSH PRIVILEGES ;" | mysql --protocol=socket -uroot