DC=docker-compose
TAG?=latest
export POSTGRES_PASSWORD?=password
export NIFTYHOSTNAME?=niftyflask.local

iterate: clean build up logs

build:
	$(DC) build

clean:
	$(DC) down

up:
	$(DC) up -d

logs:
	$(DC) logs -f

nuke:
	$(DC) down

image:
	docker build -t jtilander/niftyflask:$(TAG) .

push:
	docker push jtilander/niftyflask:$(TAG)
