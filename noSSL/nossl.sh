#!/bin/bash

# Copy new files to project folder
cp Dockerfile ../dockerized-jira8.3-mysql
cp docker-compose.yml ../dockerized-jira8.3-mysql
cp docker-compose-alter.yml ../dockerized-jira8.3-mysql
cp my.cnf ../dockerized-jira8.3-mysql/conf

# Remove unnecessary files
rm -rf ../dockerized-jira8.3-mysql/certs
rm -f  ../dockerized-jira8.3-mysql/getcert.sh
