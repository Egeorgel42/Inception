sleep 10
if [ ! -f /var/www/wordpress/wp-config.php ]
then
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'
	wp core install --allow-root \
		--url='https://egeorgel.42.fr' \
		--title='Inception' \
		--admin_user='admin' \
		--admin_password='admin' \
		--admin_email='egeorgel@student.42nice.fr' \
		--path='/var/www/wordpress'
	wp user create egeorgel --allow-root \
	egeorgel@student.42nice.fr \
	--user_pass=pass \
	--path='/var/www/wordpress'
fi
/usr/sbin/php-fpm7.3 -F