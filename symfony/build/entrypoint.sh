#!/bin/bash

#Borramos archivos para vaciar el directorio del proyecto y que comando composer no de fallo
[ -d /$PROJNAME/src ] || rm -f /$PROJNAME/.env /$PROJNAME/.gitignore && composer create-project symfony/skeleton:${SYMFONYV} $PROJNAME

cd /$PROJNAME
symfony server:start

exec bash -c "while true;do sleep 10;done"

