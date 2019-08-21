<!-- ## Dockerized JIRA v8.3 and MySQL v5.7 -->

<img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/eduardevops/jira8.3-mysql.svg" style="max-width:100%;"> <img alt="MicroBadger Size" src="https://img.shields.io/microbadger/image-size/eduardevops/jira8.3-mysql/latest.svg" style="max-width:100%;">
-----
![Logo](./assets/logo.jpg)

This is a fork of  ![This Project](https://github.com/cptactionhank/docker-atlassian-jira). <br>
If you want to use JIRA with PostgreSQL, you may want to use his project. <br>

If you want to use JIRA with MariaDB use the following project.
![JIRA with MariaDB](https://github.com/eduardevops/dockerized-jira8.3-mariadb)

##### Components Versions
*	JIRA v8.3.2
*	MySQL 5.7.27
-----
#### First things first
Before you can use this repo make sure you have [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed

#### ToDo
All names and parameters can be, and in most cases, should be edited.

#### Timeout
Depending on your server sepcs JIRA configuration (and its work in general) can be very slow, which can cause timeout issue with your web server or even with JIRA without reverse proxy (e.g. error 504, nginx).
To avoid it make sure to increase timeout settings in your webserver

------
#### Content Tree
```less
├── .env.db
├── .env.jira
├── Dockerfile
├── assets
│   └── logo.jpg
├── backup
│   ├── db_backup.sh
│   ├── db_restore.sh
│   └── jira_backup.sh
├── conf
│   ├── apache-reverse-proxy.conf
│   ├── httpd.conf
│   └── nginx-reverse-proxy.conf
├── docker-compose-alter.yml
├── docker-compose.yml
└── docker-entrypoint.sh
```
-----

##### HowTo
Clone repo to your server (I would suggest use /opt directory)
```less
sudo git clone https://github.com/eduardevops/dockerized-jira8.3-mysql.git
```
Navigate to the project folder

```less
cd /path/to/dockerized-jira8.3-mysql
```
Make docker-entrypoint.sh file executable for other and run the composer

```less
chmod o+x docker-entrypoint.sh
docker-compose up -d
```

Check logs in real-time
```less
docker-compose logs -f
```

# Contact
As the description is not complete yet, it may be confusing. So in case of any questions you may write to me <eduard.saryan@protonmail.com>
