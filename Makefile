CLEAN = docker compose down --rmi all

all :
	docker-compose -f ./srcs/docker-compose.yml up

down:
	cd srcs && $(CLEAN)

re : down all
