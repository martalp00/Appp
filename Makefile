start:
	docker-compose up --build -d

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