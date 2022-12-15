#!/bin/bash

if [ ! -z ${VUEPROJ} ]
then
	cd /vuejs_projects

	#Si no existe el proyecto lo crea
	if [ ! -d /vuejs_projects/${VUEPROJ} ]
	then
		echo "Y" | vue create -d ${VUEPROJ}
		#Arranca el proyecto
	fi
	
	cd /vuejs_projects/${VUEPROJ} && npm run serve &
fi

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

