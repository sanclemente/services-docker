#!/bin/bash

if [ ! -z ${REACTPROJ} ]
then
	cd /reactjs_projects

	#Si no existe el proyecto lo crea
	if [ ! -d /reactjs_projects/${REACTPROJ} ]
	then
		echo "y" | npx create-react-app ${REACTPROJ}
	fi
	
	cd /reactjs_projects/${REACTPROJ} && npm start &
fi

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

