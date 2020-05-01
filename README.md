### Dockerized Jira with MySQL

![Logo](./assets/logo.jpg)

### Status
<img alt="Image Size" src="https://img.shields.io/docker/image-size/eduardevops/jira8-mysql" style="max-width:100%;"> <img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/eduardevops/jira8-mysql" style="max-width:100%;"> <img alt="Build Status" src="https://img.shields.io/docker/cloud/build/eduardevops/jira8-mysql" style="max-width:100%;"> <img alt="Licenses" src="https://img.shields.io/badge/License-GPLv3-blue.svg" style="max-width:100%;">

### Table of contents
* [Prerequisites](#Prerequisites)
* [Project Tree](#Project-Tree)
* [Backup Folder](#Backup-Folder)
* [Rename](#Rename)
* [Deployment](#Deployment)

This is a fork of ![Martin Aksel Jensen's](https://github.com/cptactionhank) project ![docker-atlassian-jira](https://github.com/cptactionhank/docker-atlassian-jira)  <br>

For Jira with MariaDB use the following project ![Jira with MariaDB](https://github.com/eduardevops/dockerized-jira8-mariadb) <br>
For Jira with PostgreSQL use the following project ![Jira with PostgreSQL](https://github.com/eduardevops/dockerized-jira8-postgresql)

### Prerequisites
*	[Docker](https://www.docker.com/)
*	[Docker Compose](https://docs.docker.com/compose/install/)
------

### Project Tree
```less
├── .env.db
├── .env.jira
├── Dockerfile
├── Dockerfile-OpenJDK8
├── assets
│   └── logo.jpg
├── backup
│   ├── db_backup.sh
│   ├── db_restore.sh
│   └── jira_backup.sh
├── docker-compose.yml
└── docker-entrypoint.sh
```

### Backup Folder
| File                        | Description                                                                           |
| :-------------------------- |:------------------------------------------------------------------------------------- |
| db_backup.sh   | Small script to backup dockerized database                                                         |
| db_restore.sh  | Small script to restore dockerized database                                                        |
| jira_backup.sh | Small script to copy Jira exported XML files and remove files older then 3 days                    |

### Rename
All names can be, moreover, in most cases, should be changed.

-----

### Deployment
Clone repo to your server. I suggest using ```/opt``` directory
```less
sudo git clone https://github.com/eduardevops/dockerized-jira8-mysql.git
```

Navigate to the project folder
```less
cd /path/to/dockerized-jira8-mysql
```

Make docker-entrypoint.sh file executable for ```other``` and run the composer

```less
chmod o+x docker-entrypoint.sh
docker-compose up -d
```
