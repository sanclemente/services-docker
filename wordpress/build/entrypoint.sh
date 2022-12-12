#!/bin/bash

#Arrancamos servicios
if [ -d /var/lib/mysql ]
then
	service mariadb start
	#Crea la base de datos si no existe
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WPDB"
	#Crea el usuario si no existe y le otorga permisos a la base de datos
	if [ $(mysql -uroot -D mysql -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WPUSER')") ]
	then
		mysql -uroot -e "GRANT ALL ON $WPDB.* TO '$WPUSER'@'%' IDENTIFIED BY '$WPPASS'"
	fi
fi

[ -d /var/www/html ] && service apache2 start

exec bash -c "while true;do sleep 10;done"

