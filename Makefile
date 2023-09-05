full-reset:
	@make stop
	@make full remove
	@make setup+data

setup+data:
	@make setup
	@make data
setup:
	@make build
	@make up 

full-remove:
	docker compose rm -fsv
	docker system prune -af --volumes
	docker volume prune -af

build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d

stop:
	docker-compose stop
	
data:
	docker exec apache bash -c "php artisan migrate:reset"
	docker exec apache bash -c "php artisan migrate --force"
	docker exec apache bash -c "php artisan db:seed"
	

