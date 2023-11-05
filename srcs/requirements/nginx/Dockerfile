FROM debian:buster
RUN apt update -y; apt upgrade -y
RUN apt install openssl nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ssl_certificat.pem -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=Nice/L=Nice/O=42/OU=egeorgel/CN=egeorgel/"
COPY conf/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]