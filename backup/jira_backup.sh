#!/bin/bash

# Cron jobs
# * * * * *    /bin/bash jira8.2-mariadb/backup/jira_backup.sh >> /var/log/db_backup-cron.log
# # If you do not have a clear understanding how to configure date in crontab or you just feel too lazy to do so, use https://crontab.guru
# Very useful project

# Get current date
now=$(date +"%d.%b.%Y"-"%H:%M")

# Backup exported files
docker cp jira-web:/var/atlassian/jira/export/. /backup/jira-exported/
# Delete files older than 3 days
find /backup/jira/ -type f -iname '*.zip' -mtime +2 -exec rm {} \;
