#!make

migrate:
	docker-compose run --rm laravel php artisan migrate

start:
	docker-compose up -d
