full-reset:
	@make compose-stop
	@make compose-removal

	@make compose-buildup
	
	@make database-up

	@make key-generate
	@make cache-clear
	@make config-clear
	@make route-clear

compose-stop:
	docker-compose stop
compose-removal:
	docker compose rm -fsv
	docker system prune -af --volumes
	docker volume prune -af

compose-buildup:
	@make compose-build
	@make compose-up 
compose-build:
	docker-compose build --no-cache --force-rm
compose-up:
	docker-compose up -d

database-up:
	@make database-migrate
	@make database-seed
database-migrate:
	docker exec apache bash -c "php artisan migrate --force"
database-seed:
	docker exec apache bash -c "php artisan db:seed"	
database-reset:
	docker exec apache bash -c "php artisan migrate:reset"

key-generate:
	docker exec apache bash -c "php artisan key:generate"
cache-clear:
	docker exec apache bash -c "php artisan cache:clear"
config-clear:
	docker exec apache bash -c "php artisan config:clear"
route-clear:
	docker exec apache bash -c "php artisan route:clear"

