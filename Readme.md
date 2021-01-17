Mysql, Minio, Mailhog, Phpmyadmin and Php for devs.
----------------
  - if you are running the containers first time, we need to create a common network
    - run `make network`

  - create `.env` file under `\mysql\5.5`, `\mysql\5.7`, `\mariadb\10.1`, `\mariadb\10.3`
    * You can override the mysql root password in the `.env` file.

  - You can then run `make mysql55`,  `make mysql57` or `make mysql` to run containers with mysql 5.5, 5.7 or both respectively.
  
  - You can run `make minio-server` to start a minio server
  
  - you can run `make mailhog-server` to start a mailhog server
  
  - you can install php7.1 and php7.2 and switch between version in your host
      - run  `make install-php-7.1` to install php 7.1 fpm and related extensions 
      - run  `make install-php-7.2` to install php 7.2 fpm and related extensions
      - run  `make switch-php-7.1` to switch to php 7.1 such that php points to 7.1
      - run  `make switch-php-7.2` to switch to php 7.2 such that php points to 7.2

Mysql containers
----------------

MYSQL containers are created for versions 5.5, 5.6 and 5.7 of MYSQL, based on the official MYSQL docker images.

Each MYSQL container is accessible from the host (address 127.0.0.1). Each container uses a different port on the host:

| Container  | Version  | Port on host | Port on container  |
| ---------- | -------- | ------------ | ------------------ |
| mysql55    | 5.5      | 3355         | 3306               |
| mysql57    | 5.7      | 3307         | 3306               |
| mariadb10_1| 10.1     | 3356         | 3306               |
| mariadb10_3| 10.3     | 3308         | 3306               |


The mysql configuation is set under `mysql/{version}/conf.d`.

The mysql data is stored under `mysql/{version}/lib`.

The mariadb configuation is set under `mariadb/{version}/conf.d`.

The mariadb data is stored under `mariadb/{version}/lib`.

PhpMyAdmin
----------

| Container  | Port on host | Port on container  |
| ---------- |  ----------- | ------------------ |
| phpmyadmin |  8888        | 80                 |

You can access phpmyadmin using url `localhost:8888` Or `http://www.pma.test` if you have www.pma.test pointed to you localhost

Minio
----------

| Container  | Port on host | Port on container  | Access Key | Secret            |
| ---------- |  ------------| ------------------ | ---------- | ----------------- |
| minio      |  9000        | 9000               | uat        | tapailaigastochha |

You can access minio server using url `localhost:9000`

Mailhog
----------

| Container  | UI Port on host | SMTP port on host | SMTP port on container |
| ---------- |  -------------- | ----------------- | ---------------------- |
| mailhog    |  8025           | 1025              | 1025                   |

You can access minio server using url `localhost:8025`
