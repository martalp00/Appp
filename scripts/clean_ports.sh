#!/bin/bash

# Verificar si hay algo en ejecución en el puerto 9090
if docker ps --format '{{.Ports}}' | grep -q '0.0.0.0:9090'; then
    # Detener el contenedor correspondiente utilizando Docker Compose
    docker stop $(docker ps -q -f "expose=9090")
    echo "Contenedor del puerto 9090 detenido."
else
    echo "Nada en ejecución en el puerto 9090."
fi

# Verificar si hay algo en ejecución en el puerto 8000
if docker ps --format '{{.Ports}}' | grep -q '0.0.0.0:8000'; then
    # Detener el contenedor correspondiente utilizando Docker Compose
    docker stop $(docker ps -q -f "expose=8000")
    echo "Contenedor del puerto 8000 detenido."
else
    echo "Nada en ejecución en el puerto 8000."
fi
