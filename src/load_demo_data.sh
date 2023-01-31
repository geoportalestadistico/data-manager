#!/bin/bash


# Descomentar lo siguiente para limpiar la base de datos (¡ojo elimina toda la información!)
echo "limpiando la base de datos"
docker-compose run --rm web python manage.py flush

echo "Cargando datos demo..."
docker-compose run --rm web python manage.py loaddata demo_data.json
