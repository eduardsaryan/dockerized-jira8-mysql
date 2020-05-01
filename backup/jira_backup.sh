#!/bin/bash

# Cronjob example
# * * * * *    /bin/bash /path/to/jira_backup.sh >> /var/log/jira-cron.log


# Get current date.
now=$(date +"%d-%b-%Y")

# Copy XML files from container to host.
docker cp jira-web:/var/atlassian/jira/export/. /backup/jira-xml/
