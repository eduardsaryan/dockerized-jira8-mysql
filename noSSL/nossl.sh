#!/bin/bash

# Copy new files to project folder
cp -f Dockerfile docker-compose.yml docker-compose-alter.yml ../
cp -f my.cnf ../conf/

# Remove unnecessary files
rm -rf ../certs
rm -f  ../getcert.sh
rm -f  ../Dockerfile-MySQL
