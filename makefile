all-db:
	- docker-compose up -d mariadb10_1 mariadb10_3 mysql57 mysql55 phpmyadmin

install-php-7.1:
	- sudo apt install php7.1-fpm php7.1-cli php7.1-json php7.1-mysql php7.1-xsl php7.1-ldap php7.1-sqlite3 php7.1-xml php7.1-zip php7.1-curl php7.1-intl php7.1-mbstring

install-php-7.2:
	- sudo apt install php7.2-fpm php7.2-cli php7.2-json php7.2-mysql php7.2-xsl php7.2-ldap php7.2-sqlite3 php7.2-xml php7.2-zip php7.2-curl php7.2-intl php7.2-mbstring

install-php-7.4:
	- sudo apt install php7.4-fpm php7.4-cli php7.4-json php7.4-mysql php7.4-xsl php7.4-ldap php7.4-sqlite3 php7.4-xml php7.4-zip php7.4-curl php7.4-intl php7.4-mbstring

ldap-server:
	- docker-compose up -d ldap phpldapadmin

mailhog-server:
	- docker-compose up -d mailhog

mariadb10-1:
	- docker-compose up -d mariadb10_1 phpmyadmin

mariadb10-3:
	- docker-compose up -d mariadb10_3 phpmyadmin

mariadb-server:
	- docker-compose up -d mariadb10_1 mariadb10_3 phpmyadmin

mysql8:
	- docker-compose up -d mysql8 phpmyadmin

mysql57:
	- docker-compose up -d mysql57 phpmyadmin

mysql55:
	- docker-compose up -d mysql55 phpmyadmin

mysql:
	- docker-compose up -d mysql57 mysql55 phpmyadmin

minio-server:
	- docker-compose up -d minio

network:
	- docker network create local_default

switch-php-7.1:
	- sudo update-alternatives --set php /usr/bin/php7.1
	- sudo update-alternatives --set phar /usr/bin/phar7.1
	- sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.1

switch-php-7.2:
	- sudo update-alternatives --set php /usr/bin/php7.2
	- sudo update-alternatives --set phar /usr/bin/phar7.2
	- sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.2
