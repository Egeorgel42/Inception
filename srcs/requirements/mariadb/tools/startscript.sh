#!/bin/bash

mysql_secure_install()
{
	mysql -uroot<<EOF
	UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	FLUSH PRIVILEGES;
EOF
}

create_database()
{
	mysql -uroot<<EOF
	CREATE DATABASE $MYSQL_DATABASE;
	CREATE USER IF NOT EXISTS $MYSQL_USER IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL ON $MYSQL_DATABASE.* TO $MYSQL_USER; FLUSH PRIVILEGES;
	QUIT
EOF
}

main()
{
	echo Starting mysql service...
	if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
		service mysql start
		echo Mysql_secure_install
		mysql_secure_install
		echo secure install done.
		echo Create database...
		create_database
		sleep 2
		echo Database created
		service mysql stop
	else
		echo Database exist.
	fi
	echo Execute mysqld
	exec mysqld_safe
}

main