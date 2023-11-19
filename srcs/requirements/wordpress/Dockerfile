FROM debian:buster
RUN apt update -y; apt upgrade -y
RUN apt install wget -y; apt install php7.3 -y; apt install php-fpm -y; apt install php-mysql -y; apt install mariadb-client -y
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN mkdir -p /run/php
COPY conf/phpsrcipt.sh phpsrcipt.sh
RUN sh phpsrcipt.sh
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/config.sh config.sh
ENTRYPOINT ["sh", "config.sh"]

