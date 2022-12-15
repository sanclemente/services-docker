#!/bin/bash

#Arrancamos servicios
if [ -d /var/lib/mysql ]
then
	service mariadb start
	#Asigna password a root
	mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOTPASS}'"
	#Crea la base de datos si no existe
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB"
	#Crea el usuario si no existe y le otorga permisos a la base de datos
	if [ $(mysql -uroot -D mysql -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$DBUSER')") ]
	then
		mysql -uroot -e "GRANT ALL ON $DB.* TO '$DBUSER'@'%' IDENTIFIED BY '$DBPASS'"
	fi
fi

if [ -d /var/www/html ]
then
	service apache2 start
	[ -d /laravel_projects/${LPROJECT} ] || composer create-project laravel/laravel /laravel_projects/${LPROJECT}
	cd /laravel_projects/${LPROJECT} && php artisan serve --host 0.0.0.0
fi

exec bash -c "while true;do sleep 10;done"

