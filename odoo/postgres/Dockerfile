FROM debian:bullseye

ENV TERM xterm
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

LABEL distribucion="Debian 11"
LABEL descripcion="Imagen Postgres para Odoo"

#Argumento tomado del docker-compose.yml para seleccionar el archivo .env->envfile
ARG ENVPATH

#Copiamos el envfile al container
COPY ${ENVPATH} /tmp/envfile

#Copiamos el entrypoint.sh al container
COPY entrypoint.sh /usr/bin/entrypoint.sh
#Damos permiso al entrypoint
RUN chmod +x /usr/bin/entrypoint.sh

#Instalamos paquetes
RUN /bin/bash -c 'source /tmp/envfile; apt update; apt install -y $PACKS'

#Ejecutamos lista de comandos del envfile particular
RUN /bin/bash -c 'source /tmp/envfile;IFS=',';for command in $COMMANDS;do sh -c $command;done'

#Limpiando
RUN apt clean

#Comando para arrancar ssh y entrar en bucle de espera
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
