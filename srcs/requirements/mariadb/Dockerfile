FROM debian:buster
RUN apt update -y; apt upgrade -y
RUN apt install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/startscript.sh startscript.sh
ENTRYPOINT ["sh", "startscript.sh"]