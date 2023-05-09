start:
	docker-compose up --build -d
	./start_grafana.sh

stop:
	docker-compose down

migrate:
	docker-compose run web python manage.py migrate

pylint:
	pylint appp

isort:
	isort . --check --diff

lint:
	isort .