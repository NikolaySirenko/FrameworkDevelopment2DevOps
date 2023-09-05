full-reset:
	@make compose-stop
	@make compose-removal

	@make compose-buildup
	
	@make database-up

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
	docker exec apache bash -c "php artisan migrate --force"
	docker exec apache bash -c "php artisan db:seed"	
database-reset:
	docker exec apache bash -c "php artisan migrate:reset"
