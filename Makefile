build:
	docker build -t appp_image:latest .

start:
	docker run -d --name appp_container -p 8000:8000 appp_image

stop:
	docker stop appp_container
	docker rm appp_container

migrate:
	docker-compose run web python manage.py migrate

pylint:
	pylint appp

isort:
	isort . --check --diff

lint:
	isort .