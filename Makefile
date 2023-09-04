full reset:
	@make full remove
	@make setup+data

setup+data:
	@make setup
	@make data
setup:
	@make build
	@make up 

full remove:
	docker compose rm -fsv
	docker image prune -af

build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d

stop:
	docker-compose stop
	
data:
	docker exec apache bash -c "php artisan migrate --force"
	docker exec apache bash -c "php artisan db:seed"

