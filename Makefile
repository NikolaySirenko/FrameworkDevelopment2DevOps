setup+data:
	@make setup
	@make data
setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec apache bash -c "composer update"
data:
	docker exec apache bash -c "php artisan migrate --force"
	docker exec apache bash -c "php artisan db:seed"

