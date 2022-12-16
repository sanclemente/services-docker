# Escenario laravel

Despliegue de un servidor LAMP con framework laravel con dos services:

## apache

### Variables de entorno

- *LPROJECT*: nombre del proyecto laravel creado automáticamente

### Volúmenes

Mapeo del directorio dentro del escenario:

- ./laravel_projects->/laravel_projects

### Puertos mapeados

- 8000:8000 (http)

## mariadb

### Variables de entorno

- *DB*: base de datos para laravel
- *DBUSER*: usuario de la base de datos de laravel
- *DBPASS*: password del usuario de la base de datos de laravel
- *ROOTPASS*: password del usuario root de mariadb

### Puertos mapeados

- 8006:3306 (mysql)
- 8081:80 (phpmyadmin)

Las variables de entorno se definen en el archivo docker-compose.yml

## Volúmenes

- mariadb-data->/var/lib/mysql

