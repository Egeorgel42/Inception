FROM debian:buster
RUN apt-get update -y; apt-get upgrade -y
RUN apt-get install mariadb-server mariadb-client -y
RUN chown -R mysql:mysql /var/lib/mysql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/startscript.sh startscript.sh
RUN chmod 755 startscript.sh
ENTRYPOINT ["./startscript.sh"]