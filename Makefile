all :
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

re : down all
