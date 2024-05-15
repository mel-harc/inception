all :
	mkdir -p /home/melharc/data/wp
	mkdir -p /home/melharc/data/db
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

re : down all
