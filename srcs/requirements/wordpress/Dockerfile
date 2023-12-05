FROM debian:buster
RUN apt-get update -y; apt-get upgrade -y
RUN apt-get install wget -y; apt-get install php7.3 -y; apt install php-fpm -y; apt install php-mysql -y; apt install mariadb-client -y
RUN mkdir -p /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/config.sh config.sh
ENTRYPOINT ["sh", "config.sh"]
