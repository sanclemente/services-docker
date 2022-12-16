# Escenario odoo

Despliegue de un servidor Odoo con dos services:

## odoo

### Variables de entorno

- *ODOOV*: versión de odoo
- *DBUSER*: usuario postgres para las bases de datos de odoo
- *CONFIGFILE*: ruta al archivo de configuración
- *SRCDIR*: directorio de fuentes de odoo
- *EXTMDIR*: directorio de módulos externos
- *LOGFILE*: archivo de log
- *LOCALFS*: directorio .local de odoo
- *OCBDIR*: directorio de fuentes de OCA/OCB
- *REPOS*: lista de repositorios a descargar y activar

### Volúmenes

Mapeo de los directorios dentro del escenario:

- ./odoo/src->/opt/odoo/src
- ./odoo/logs->/var/log/odoo

Volumen docker para filestore:

odoo:fs->/opt/odoo/.local/share/Odoo/filestore

### Puertos mapeados

- 8069:8069 (http)

## postgres

### Variables de entorno

- *DBUSER*: usuario postgres para las bases de datos de odoo
- *POSTMAINDIR*: ruta a la configuración de postgres

### Puertos mapeados

- 5432:5432 (postgres)

## Volúmenes

Volumen docker para las bases de datos

- postgres_db->/var/lib/postgresql/13/main

