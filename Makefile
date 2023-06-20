RUN=docker run
START=docker start
STOP=docker stop
DB_STACK=docker compose -f ./docker-compose-db-stack.yml
WEB_STACK=docker compose -f ./docker-compose-web-stack.yml

db-stack-up:
	@$(DB_STACK) up -d --build --remove-orphans

db-stack-down:
	@$(DB_STACK) down -v

db-stack-stop:
	@$(DB_STACK) stop -v

mysql8-start:
	@$(DB_STACK) up -d --build --remove-orphans mysql8

mysql8-stop:
	@$(DB_STACK) stop mysql8

postgres-start:
	@$(DB_STACK) up -d --build --remove-orphans postgres

postgres-stop:
	@$(DB_STACK) stop postgres

mssqlserver-start:
	@$(DB_STACK) up -d --build --remove-orphans mssqlserver

mssqlserver-stop:
	@$(DB_STACK) stop mssqlserver

portainer-run:
	@$(RUN) -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

portainer-start:
	@$(START) portainer

portainer-stop:
	@$(STOP) portainer

redis-run:
	@$(RUN) -d --name redis-stack-server -p 6379:6379 redis/redis-stack-server:latest

redis-start:
	@$(START) redis-stack-server

redis-stop:
	@$(STOP) redis-stack-server

mongo-start:
	@$(DB_STACK) up -d --build --remove-orphans mongodb

mongo-stop:
	@$(DB_STACK) stop mongodb

nginx-start:
	@$(WEB_STACK) up -d --build --remove-orphans nginx

nginx-stop:
	@$(WEB_STACK) stop nginx
