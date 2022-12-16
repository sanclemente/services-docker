# Escenario lamp

Despliegue de un servidor LAMP con dos services:

## apache

Escuchando en el puerto 8080 en localhost

### Volúmenes

- wp_data->/var/www/html/wordpress/data

### Puertos mapeados

- 8080:80 (http)
- 8043:443 (https)

## mariadb

### Variables de entorno

- *DB*: base de datos para lamp
- *DBUSER*: usuario de la base de datos de lamp
- *DBPASS*: password del usuario de la base de datos de lamp
- *ROOTPASS*: password del usuario root de mariadb

### Puertos mapeados

- 8006:3306 (mysql)
- 8081:80 (phpmyadmin)

Las variables de entorno se definen en el archivo docker-compose.yml

## Volúmenes

- mariadb-data->/var/lib/mysql

