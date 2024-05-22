all :
	mkdir -p /home/mel-harc/data/wp
	mkdir -p /home/mel-harc/data/db
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down
	docker volume rm DataBase WordPress
	docker system prune -a
	cd .. && sudo rm -rf data

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

restart:
	docker-compose -f ./srcs/docker-compose.yml restart

re : down all
