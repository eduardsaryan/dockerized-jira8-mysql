#!/bin/bash

# Cronjob example
# * * * * *    /bin/bash /path/to/db_backup.sh >> /var/log/db-cron.log


# Getting current date.
now=$(date +"%d-%b-%Y")

# Backup database.
source /path/to/dockerized-jira8-mysql/.env.db
docker exec -i $(docker ps -qf name=website-db) mysqldump --default-character-set=utf8mb4 -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > /path/to/backup-folder/${MYSQL_DATABASE}_${now}.sql
