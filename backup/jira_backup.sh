#!/bin/bash

# Cron jobs
#*/3 * * * *    /bin/bash /opt/scripts/db_backup.sh >> /var/log/db_cron.log
#*/5 * * * *    /bin/bash  /opt/scripts/jira_backup.sh >> /var/log/jira_cron.log

# Get current date
now=$(date +"%d.%b.%Y"-"%H:%M")

# Backup exported files
docker cp jira-web:/var/atlassian/jira/export/. /backup/jira-exported/
# Delete files older than 3 days
find /backup/jira/ -type f -iname '*.zip' -mtime +3 -exec rm {} \;
