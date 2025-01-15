all: wordpress_data mariadb_data
	make up

up: wordpress_data mariadb_data
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	rm -rf wordpress_data mariadb_data

re: fclean
	make all

mariadb_data:
	mkdir -p ~/data/mariadb

wordpress_data:
	mkdir -p ~/data/wordpress

.PHONY: all up down clean fclean re
