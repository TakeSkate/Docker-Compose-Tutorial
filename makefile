#DockerFile

up:
	docker-compose up -d

start: up

stop:
	docker-compose stop

down: stop
restart: stop up

rebuild: clean
	docker-compose build --force-rm --no-cache
	docker-compose up -d

build: clean
	docker-compose build
	docker-compose up -d

clean:
	docker-compose rm -vsf
	docker-compose down -v --remove-orphans
