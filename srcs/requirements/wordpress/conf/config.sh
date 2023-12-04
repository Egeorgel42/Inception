sleep 2
if [ ! -f /var/www/wordpress/wp-config.php ]
then
	sed -i '/;clear_env = no/ { c \
	clear_env = no
	}' /etc/php/7.3/fpm/pool.d/www.conf
	sed -i '/listen =/ { c \
	listen=wordpress:9000
	}' /etc/php/7.3/fpm/pool.d/www.conf
	mkdir -p /var/www/wordpress
	cd /var/www/wordpress
	wp core download --allow-root
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb \
		--path='/var/www/wordpress'
	wp core install --allow-root \
		--url='https://egeorgel.42.fr' \
		--title='Inception' \
		--admin_user=$WP_USER \
		--admin_password=$WP_PASSWORD \
		--admin_email='egeorgel@student.42nice.fr'
	wp user create egeorgel --allow-root \
	ethangeorgel2003@gmail.com \
	--user_pass=pass
fi
/usr/sbin/php-fpm7.3 -F