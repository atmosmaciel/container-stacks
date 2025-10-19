RUN=docker run
START=docker start
STOP=docker stop
DB_STACK=docker compose -f ./compose-db-stack.yml
WEB_STACK=docker compose -f ./compose-web-stack.yml
PORTAINER=docker compose -f ./compose-portainer.yaml

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

portainer-up:
	@$(PORTAINER) up -d --build --remove-orphans

portainer-down:
	@$(PORTAINER) down -v

portainer-stop:
	@$(PORTAINER) stop

portainer-start:
	@$(PORTAINER) up -d

redis-start:
	@$(DB_STACK) up -d --build --remove-orphans redis

redis-stop:
	@$(DB_STACK) stop redis

redis-commander-start:
	@$(DB_STACK) up -d --build --remove-orphans redis-commander

redis-commander-stop:
	@$(DB_STACK) stop redis-commander

mongo-start:
	@$(DB_STACK) up -d --build --remove-orphans mongodb

mongo-stop:
	@$(DB_STACK) stop mongodb

nginx-start:
	@$(WEB_STACK) up -d --build --remove-orphans nginx

nginx-stop:
	@$(WEB_STACK) stop nginx
