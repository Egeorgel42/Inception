FROM debian:buster
RUN apt-get update -y; apt-get upgrade -y
RUN apt-get install openssl nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/ssl_certificat.pem -keyout /etc/nginx/ssl/ssl_key.key -subj "/C=FR/ST=Nice/L=Nice/O=42/OU=egeorgel/CN=egeorgel/"
COPY conf/default.conf /etc/nginx/conf.d/default.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT	["nginx", "-g", "daemon off;"]