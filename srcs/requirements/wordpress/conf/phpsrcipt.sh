sed -i '/;clear_env = no/ { c \
clear_env = no
}' /etc/php/7.3/fpm/pool.d/www.conf
sed -i '/listen =/ { c \
listen=wordpress:9000
}' /etc/php/7.3/fpm/pool.d/www.conf