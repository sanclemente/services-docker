#!/bin/bash

#Sustituimos las variables de entorno en el odoo.sh
sed -i "s/OCBDIR/$OCBDIR/" /etc/init.d/odoo.sh

#Creamos el archivo de log y cambiamos propietario
mkdir -p $(dirname $LOGFILE)
touch $LOGFILE
chown odoo:odoo $LOGFILE

#Cambiamos propietario del filestore
[ $(stat -c "%G" $LOCALFS) == "odoo" ] || chown -R odoo:odoo $LOCALFS

#Comprobamos si los módulos de OCA están disponibles, si no los descargamos
[ -d $SRCDIR/$OCBDIR ] || git clone -b $ODOOV --depth 1 https://github.com/OCA/OCB $SRCDIR/$OCBDIR

#Iniciamos ADDONS con los addons de OCB
ADDONS="${SRCDIR}/${OCBDIR}/addons"

#Procesamos repositorios en $REPOS, si no existen se crean en el directorio de módulos externos
mkdir -p $EXTMDIR
for repo in $(echo $REPOS | tr ',' ' ')
do
        RNAME=$(echo $repo | rev | cut -d"/" -f1 | rev)
        [ -d $EXTMDIR/$RNAME ] || git clone -b $ODOOV --depth 1 $repo $EXTMDIR/$RNAME
        ADDONS=${ADDONS},${EXTMDIR}/$RNAME
done

#Generamos una password aleatoria para el usuario de odoo en la base de datos
DBPASS=$(openssl rand -base64 16)

#Cambia la password para el usuario de odoo en la base de datos
psql -h postgres -U postgres -c "alter role $DBUSER with password '$DBPASS'"

#Sustituímos el usuario de la base de datos en odoo.conf
sed -i "s/db_user*/db_user = $DBUSER" $CONFIGFILE
#Sustituímos la password de la base de datos en odoo.conf
sed -i "s/db_password*/db_password = $DBPASS" $CONFIGFILE

#Arranca odoo inyectando los ADDONS 
export ADDONS=$ADDONS
while [[ ! $(/etc/init.d/odoo.sh start) ]];do continue;done

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

