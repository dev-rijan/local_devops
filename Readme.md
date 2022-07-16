## Mysql, Minio, Mailhog, Phpmyadmin and Php for devs.

- if you are running the containers first time, we need to create a common network
```
make network
```

- Generate `.env` file form env.dist. `.env` files are located on `mysql/{version}/.env`, `mariadb/{version}/.env`, `minio/.env` for `mysql`, `mariadb` and `minio` respectively. You can add or update configuration (mysql root password, minio user and password etc) by overiding config in `.env` file.
```
make env_files
```

## Mysql containers

MYSQL containers are created for versions 5.5, 5.7 and 8 of MYSQL, based on the official MYSQL docker images.  
MariaDB containers are created for versions 10.3 and 10.7 of MariaDB, based on the official MariaDB docker images.

Each MYSQL and MariaDB container is accessible from the host (address 127.0.0.1). Each container uses a different port on the host:

| command to run container   | Container   | Version | Port on host | Port on container |
| -------------------------- | ----------- | ------- | ------------ | ----------------- |
| make mysql55               | mysql55     | 5.5     | 3305         | 3306              |
| make mysql57               | mysql57     | 5.7     | 3307         | 3306              |
| make mysql8                | mysql8      | 8.0     | 3308         | 3306              |
| mariadb10-3                | mariadb10_3 | 10.3    | 3356         | 3306              |
| mariadb10-7                | mariadb10_7 | 10.7    | 3357         | 3306              |

The mysql configuation is set under `mysql/{version}/conf.d`.

The mysql data is stored under `mysql/{version}/lib`.

The mariadb configuation is set under `mariadb/{version}/conf.d`.

The mariadb data is stored under `mariadb/{version}/lib`.

## PhpMyAdmin

| Container  | Port on host | Port on container |
| ---------- | ------------ | ----------------- |
| phpmyadmin | 8888         | 80                |

You can access phpmyadmin using url `localhost:8888` Or `http://www.pma.test` if you have www.pma.test pointed to you localhost

## Minio
[Minio](https://min.io/) is native object storage compatible with AWS s3.  
Run container using
```
make minio-server
```
You can overide root user and root password by updating `.env` file.

| Container | Port on host | Port on container | Rootuser   | Root password     |
| --------- | ------------ | ----------------- | ---------- | ----------------- |
| minio     | 9000         | 9000              | minio      | miniominio        |

You can access minio server using url `localhost:9000`

## Mailhog
[Mailhog](https://github.com/mailhog/MailHog) is Web and API based SMTP testing.  
Run container using
```
make mailhog-server
```

| Container | UI Port on host | SMTP port on host | SMTP port on container |
| --------- | --------------- | ----------------- | ---------------------- |
| mailhog   | 8025            | 1025              | 1025                   |

You can access minio server using url `localhost:8025`

## Install and switch php versions  
you can install php7.1, php7.2 and php7.4 and switch between version in your host  
you can also install other php version just like command written in make file but make sure you have add correct php repository.
  - run `make install-php-7.1` to install php 7.1 fpm and related extensions
  - run `make install-php-7.2` to install php 7.2 fpm and related extensions
  - run `make install-php-7.4` to install php 7.4 fpm and related extensions
  - run `make switch-php-7.1` to switch to php 7.1 such that php points to 7.1
  - run `make switch-php-7.2` to switch to php 7.2 such that php points to 7.2
  - run `make switch-php-7.4` to switch to php 7.4 such that php points to 7.4

