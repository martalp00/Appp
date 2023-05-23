start:
	docker-compose up --force-recreate --build -d web
	make grafana
	make start-jenkins

stop:
	docker-compose down

start-pipeline:
	docker-compose up --force-recreate --build -d web

stop-pipeline:
	docker-compose down --rmi local

clean-ports:
	./scripts/clean_ports.sh

start-jenkins:
	systemctl start jenkins
	./scripts/ngrok_start.sh

grafana:
	/etc/init.d/grafana-server start

stop-jenkins:
	systemctl stop jenkins

stop-ngrok:
	./scripts/ngrok_stop.sh

pylint:
	pylint appp

isort:
	isort . --check --diff

lint:
	isort .

build:
	docker build -t appp-web:latest .
	docker tag appp-web:latest martalp00/appp:proj
	docker push martalp00/appp:proj

k8s:
	minikube start
	kubectl apply -k deploy/
	make grafana
	make start-jenkins
