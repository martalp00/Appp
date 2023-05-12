start:
	docker-compose up --force-recreate --build -d web
	/etc/init.d/grafana-server start

start-jenkins:
	systemctl start jenkins
	./scripts/ngrok_start.sh

stop:
	docker-compose down
	/etc/init.d/grafana-server stop

stop-jenkins:
	systemctl stop jenkins

stop-ngrok:
	./scripts/ngrok_stop.sh

migrate:
	docker-compose run web python manage.py migrate

pylint:
	pylint appp

isort:
	isort . --check --diff

lint:
	isort .