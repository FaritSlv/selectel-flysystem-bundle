up: docker-up
down: docker-down
restart: docker-down docker-up
init: docker-down-clear docker-pull docker-build docker-up

test: init run-test down

run-test:
	docker-compose exec php-fpm php ./vendor/phpunit/phpunit/phpunit --configuration ./phpunit.xml.dist

prune:
	docker system prune -a

prune-and-rebuild: prune
	docker-compose build --force-rm --no-cache

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build

clear-cache:
	docker-compose exec php-fpm symfony console cache:clear
