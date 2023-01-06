.DEFAULT_GOAL := help


help:
	@echo 'Available commands:'
	@echo -e 'runserver \t\t - \t Runs Flask server via gunicorn'
	@echo -e 'runserver-py \t\t - \t Runs Flask server via python'


###################################################################################
# WebServer
###################################################################################

runserver-py:
	python ./src/app.py

runserver:
	gunicorn --bind 0.0.0.0:5000 --chdir ./src wsgi:app

docker-build:
	docker build .

dev-build:
	docker-compose build

dev-run:
	docker-compose up -d --build

dev-stop:
	docker-compose down

prod-build:
	docker-compose -f docker-compose.prod.yml build

prod-run:
	docker-compose -f docker-compose.prod.yml up -d --build

prod-stop:
	docker-compose -f docker-compose.prod.yml down
