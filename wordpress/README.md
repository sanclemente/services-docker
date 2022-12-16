# Escenario wordpress

Despliegue de un servidor LAMP con wordpress en dos services:

## apache

### Volúmenes

Volumen docker para almacenar los datos de wordpress

- wp_data->/var/www/html/wordpress/data

### Puertos mapeados

- 8080:80 (http)
- 8043:443 (https)

## mariadb

### Variables de entorno

- *WPDB*: base de datos de wordpress
- *WPUSER*: usuario de la base de datos de wordpress
- *WPPASS*: password del usuario de la base de datos de wordpress

### Puertos mapeados

- 8006:3306 (mysql)

Las variables de entorno se definen en el archivo docker-compose.yml

## Volúmenes

Volumen docker para almacenar las bases de datos

- mariadb-data->/var/lib/mysql

