#!/bin/bash

ODOOIP=$(getent hosts odoo | awk '{ print $1 }')

#Habilitar acceso desde host remotos a postgres
[[ $(grep "^host all all ${ODOOIP}/32 trust" $POSTMAINDIR/pg_hba.conf) ]] || echo "host all all ${ODOOIP}/32 trust" >> $POSTMAINDIR/pg_hba.conf
[[ $(grep "^listen_addresses='*'" $POSTMAINDIR/postgresql.conf) ]] || echo "listen_addresses='*'" >> $POSTMAINDIR/postgresql.conf

#Arrancamos postgres
service postgresql start

#Creamos el usuario para bases de datos de Odoo
su - postgres -c "createuser --createdb $DBUSER"

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

