RUN=docker run
START=docker start
STOP=docker stop
DB_STACK=docker compose -p db-stack -f ./compose-db-stack.yml
WEB_STACK=docker compose -p web-stack -f ./compose-web-stack.yml
PORTAINER=docker compose -p portainer -f ./compose-portainer.yaml
NETWORK_NAME=container-stack-network

# Network management
network-create:
	@docker network inspect $(NETWORK_NAME) >/dev/null 2>&1 || docker network create $(NETWORK_NAME)

network-remove:
	@docker network rm $(NETWORK_NAME) 2>/dev/null || true

# Database stack commands
db-stack-up: network-create
	@$(DB_STACK) up -d --build

db-stack-down:
	@$(DB_STACK) down -v

db-stack-stop:
	@$(DB_STACK) stop -v

mysql-start: network-create
	@$(DB_STACK) up -d --build mysql

mysql-stop:
	@$(DB_STACK) stop mysql

postgres-start: network-create
	@$(DB_STACK) up -d --build postgres

postgres-stop:
	@$(DB_STACK) stop postgres

mssqlserver-start: network-create
	@$(DB_STACK) up -d --build mssqlserver

mssqlserver-stop:
	@$(DB_STACK) stop mssqlserver

# Portainer commands
portainer-up: network-create
	@$(PORTAINER) up -d --build

portainer-down:
	@$(PORTAINER) down -v

portainer-stop:
	@$(PORTAINER) stop

portainer-start:
	@$(PORTAINER) up -d

# Redis commands
redis-start: network-create
	@$(DB_STACK) up -d --build redis

redis-stop:
	@$(DB_STACK) stop redis

redis-commander-start: network-create
	@$(DB_STACK) up -d --build redis-commander

redis-commander-stop:
	@$(DB_STACK) stop redis-commander

# MongoDB commands
mongo-start: network-create
	@$(DB_STACK) up -d --build mongodb

mongo-stop:
	@$(DB_STACK) stop mongodb

# Web stack commands
nginx-start: network-create
	@$(WEB_STACK) up -d --build nginx

nginx-stop:
	@$(WEB_STACK) stop nginx
