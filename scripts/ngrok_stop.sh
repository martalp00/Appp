#!/bin/bash

# Obtener el ID del proceso ngrok
ngrok_pid=$(pgrep ngrok)

if [ -z "$ngrok_pid" ]; then
  echo "ngrok no se está ejecutando."
else
  # Detener el proceso ngrok
  kill $ngrok_pid
  echo "ngrok detenido correctamente."
fi
