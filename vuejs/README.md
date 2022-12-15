# Instrucciones para crear la aplicación en Vue.js de gestión de Gitlab

## Preparar entorno

Una vez levantado el service con:

```console
docker-compose up -d
```

Entramos en el servicio:

```console
docker-compose exec nodejs bash
```

## Creando la Aplicación Vue

Para crear una plantilla para empezar a trabajar en un proyecto Vue.js genérico:

```console
cd /src

vue create gitlab-app
```

Seleccionamos la opción de selección manual y marcamos

* Progressive Web App
* Router
* etc. (según las necesidades del proyecto)

A continuación:

* elegimos la versión 3 de Vue.js

* Opciones de eslint por defecto

* Todo lo demás por defecto


Vamos a necesitar herramientas para trabajar con GraphQL:

```console
npm install --save vue-apollo graphql apollo-boost
```

## Generación de módulos

Para generar los módulos necesarios para arrancar el servidor

```console
npm install
```

## Arranque del servidor

Para arrancar el servidor de desarrollo, desde dentro del proyecto

```console
npm run serve
```

Esto levantará el servicio en el puerto 8080/tcp

## Referencias











