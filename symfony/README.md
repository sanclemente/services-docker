# Escenario symfony

Despliegue de un servidor php con symfony framework en un service:

## symfony

### Variables de entorno

- *SYMFONYV*: versión de symfony
- *PROJNAME*: nombre del proyecto que se crea automáticamente en /symfony_projects

### Volúmenes

Mapeo del directorio symfony_projects dentro del escenario

- /symfony_projects->/symfony_projects

### Puertos mapeados

- 8000:8000 (http)


