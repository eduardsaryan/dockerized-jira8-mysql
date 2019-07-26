<!-- ## Dockerized JIRA v8.3 and MySQL v5.7 -->

<img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/eduardevops/jira8.3-mysql.svg" style="max-width:100%;"> <img alt="MicroBadger Size" src="https://img.shields.io/microbadger/image-size/eduardevops/jira8.3-mysql/latest.svg" style="max-width:100%;">
-----

![Logo](./assets/logo.jpg)

------

# INFO!!!
####  Still working on this. All necessary comments will be provided at the very end
####  Don't use this

This is a fork of  ![This Project](https://github.com/cptactionhank/docker-atlassian-jira) <br>
![Martin Aksel Jensen](https://github.com/cptactionhank) did a great job

If you want to use JIRA with MariaDB use the following project. <br>
![JIRA with MariaDB](https://github.com/eduardevops/dockerized-jira8.3-mariadb)

------

## First things first
Before you can use this repo make sure you have [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/install/) installed

## Versions
*	JIRA v8.3.0
*	MySQL v5.7.27

-----
## NGINX
Depending on your server sepcs JIRA configuration (and its work in general) can be very slow, which can cause nginx to stop working with error 504. To avoid this add proxy timeout settings to your nginx.conf or increase value of proxy_read_timeout in your reverse proxy setting

#### nginx.conf

```bash
  proxy_connect_timeout       600;
  proxy_send_timeout          600;
  proxy_read_timeout          600;
  send_timeout                600;
```
-----

------
## Content

### Tree

```bash
.
├── assets
│   ├── logo.jpg
│   ├── show.jpg
│   └── status.jpg
├── backup
│   ├── db_backup.sh
│   ├── db_restore.sh
│   └── jira_backup.sh
├── certs
│   ├── ca-key.pem
│   ├── ca.pem
│   ├── client-cert.pem
│   ├── client-key.pem
│   ├── client-req.pem
│   ├── server-cert.pem
│   ├── server-key.pem
│   └── server-req.pem
├── conf
│   ├── apache-reverse-proxy.conf
│   ├── httpd.conf
│   ├── my.cnf
│   └── nginx-reverse-proxy.conf
├── docker-compose-alter.yml
├── docker-compose.yml
├── docker-entrypoint.sh
├── Dockerfile
├── Dockerfile-MySQL
├── .env.certs
├── .env.db
├── .env.jira
├── gencerts.sh
└── noSSL
    ├── docker-compose-alter.yml
    ├── docker-compose.yml
    ├── Dockerfile
    ├── my.cnf
    └── nossl.sh

```

### Description

Name | Description
------------------- | -------------
.env.db             | MySQL Database root password. As well as new Database user and password
.env.jira           | Jira container environments
Dockerfile          | As it says, Dockerfile from which image will be build
docker-compose.yml  | Main file of the project that builds and links containers


------

-----
#### ToDo
All names and parameters can be, and in most cases should be edited.

-----

#### Run
Clone repo to your server (I would suggest to use /opt directory)
```bash
sudo git clone https://github.com/eduardevops/dockerized-jira8.3-mysql.git
```

Make sure your user is a member of Docker group
```sh
usermod -aG docker <username>
```
Navigate to the project folder
```sh
cd /path/to/dockerized-jira8.3-mysql
```
Make ```bash docker-entrypoint.sh ``` file executable for others and run the composer
```sh
chmod o+x docker-entrypoint.sh
docker-compose up -d
```

Check logs in real-time
```sh
docker-compose logs -f
```

-----
#### Check SSL

##### If you want to make sure that SSL is enabled for MySQL
You can use one of 2 options
1.  Get inside the container
    ```bash
    docker container exec -it jira-db bash
    ```
    Connect to MySQL
    ```bash
    mysql -u root -p
    ```
    Use the password you set earlier on .env.db file

2.  Uncomment 'ports' section in 'docker-compose.yml' file
    Example
    ```yaml
    ...
    ports:
      - 33060:3306
    ...
    ```
    Connect to MySQL server
    ```bash
    mysql -v -h 127.0.0.1 --port=33060 -u root -p \
    --ssl-ca=certs/ca.pem \
    --ssl-cert=certs/client-cert.pem \
    --ssl-key=certs/client-key.pem
    ```

Once connected to MySQL console, run
```sql
USE jira_db;
SHOW VARIABLES LIKE '%ssl%';
```
![Show](./assets/show.jpg)

Or
```sql
STATUS;
```
![Status](./assets/status.jpg)

-----

### noSSL
If for any reason you want to use MySQL without SSL you need to use files from noSSL folder
Maybe I am to lazy, but I find it very complicated to describe of changes necessary in order to
switch from default SSL mode to noSSL. So simple run nossl.sh
It will replace files from project with ones from noSSL folder so you can run JIRA+MySQL without SSL
