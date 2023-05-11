#!/bin/bash

# Iniciar ngrok en segundo plano
ngrok http http://localhost:8080/ > /dev/null 2>&1 &

# Esperar unos segundos para que ngrok establezca la conexión
sleep 2

# Obtener la URL generada por ngrok
url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

# Agregar "/github-webhook/" al final de la URL generada
url="$url/github-webhook/"

# Imprimir la URL generada
echo "------------------------------------------------------------------------------------"
echo "PASOS A SEGUIR:"
echo "Copiar la url generada en https://github.com/martalp00/Appp/settings/hooks/413951945"
echo "URL generada por ngrok: $url"