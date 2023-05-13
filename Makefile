start:
	docker-compose up --force-recreate --build -d web
	/etc/init.d/grafana-server start

stop:
	docker-compose down
	/etc/init.d/grafana-server stop

start-pipeline:
	docker-compose up --force-recreate --build -d web

stop-pipeline:
	docker-compose down

clean-ports:
	./scripts/clean_ports.sh

start-jenkins:
	systemctl start jenkins
	./scripts/ngrok_start.sh

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