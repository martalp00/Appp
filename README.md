# MANUAL DE USUARIO

## Despliegue de la aplicación con Docker

1. Acceder a la terminal de Ubuntu y clonar el repositorio de Github con los
ficheros del proyecto.
```
git clone git@github.com:martalp00/Appp.git
```

2. Acceder a la carpeta raíz del proyecto y desde la misma instalar las
dependencias del proyecto.
```
cd appp
sudo apt-get install pip
pip install pipenv
pipenv install
```

3. Crear un entorno virtual para no tener problemas con las distintas
versiones y construir y ejecutar la aplicación. (Es necesario introducir la
contraseña del usuario dos veces cuando aparezca una ventana
indicándolo, ya que se ejecutan comandos internos que necesitan permiso
de administrador).
```
pipenv shell
make start
```

4. Cuando termine toda la ejecución, seguir los pasos que se indican en la
terminal donde pone “PASOS A SEGUIR”, para la configuración de Jenkins
con Github.

5. Ya puedes acceder a cualquiera de estas url y visualizar todo.

  [Página principal de la aplicación](http://0.0.0.0:8000/)

  [Trabajos de Jenkins](http://localhost:8080/blue/organizations/jenkins/appp/activity)

  [Métrica en el servidor de Prometheus](http://localhost:9090/graph?g0.expr=metric_count_artist_searches_total&g0.tab=1&g0.stacked=0&g0.show_exemplars=0&g0.range_input=1h)

  [Métrica vista desde gráficos en Grafana](http://localhost:3000/d/c021cade-112b-454f-929a-c21617ff5c90/app?orgId=1&from=now-5m&to=now)


## Despliegue de la aplicación con Kubernetes

1. Acceder a la terminal y clonar el repositorio de Github con los ficheros
del proyecto en la máquina local.
```
git clone git@github.com:martalp00/Appp.git
```

2. Instalar las dependencias del proyecto desde la carpeta raíz del
proyecto.
```
cd appp
sudo apt-get install pip
pip install pipenv
pipenv install
```

3. Crear un entorno virtual para prevenir problemas que puedan surgir por
las distintas versiones. Instalar la tecnología de Minikube y kubectl para el
despliegue en Kubernetes, y luego, ejecutar la aplicación completa. (El comando
de ejecución requiere que el usuario introduzca su contraseña dos veces seguida
cuando aparezca una ventana indicándolo, ya que se ejecutan comandos internos
que necesitan permiso de administrador).

```
pipenv shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikubelinux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
make k8s
```

4. Cuando termine toda la ejecución, el usuario ha de seguir los pasos que se
indican en la terminal donde se indica “PASOS A SEGUIR”, para la correcta
configuración de la conexión de Jenkins con Github.

5. Ya puedes acceder a cualquiera de estas url y visualizar todo.

  [Página principal de la aplicación](http://192.168.49.2:31800/)

  [Trabajos de Jenkins](http://localhost:8080/blue/organizations/jenkins/appp/activity/)

  [Métrica en el servidor de Prometheus](http://192.168.49.2:31900/graph?g0.expr=metric_count_artist_searches_total&g0.tab=1&g0.stacked=0&g0.show_exemplars=0&g0.range_input=1h)

  [Métrica vista desde gráficos en Grafana](http://localhost:3000/d/f54a0203-cadd-4df6-9ee4-0bd36db59b81/appp-k8s?from=now-5m&to=now&orgId=1)
