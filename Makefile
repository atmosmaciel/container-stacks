RUN=docker run
START=docker start
STOP=docker stop
DB_STACK=docker compose -p db-stack -f ./compose-db-stack.yml
WEB_STACK=docker compose -p web-stack -f ./compose-web-stack.yml
PORTAINER=docker compose -p portainer -f ./compose-portainer.yaml

# Database stack commands
db-stack-up:
	@$(DB_STACK) up -d --build

db-stack-down:
	@$(DB_STACK) down -v

db-stack-stop:
	@$(DB_STACK) stop -v

mysql-start:
	@$(DB_STACK) up -d --build mysql

mysql-stop:
	@$(DB_STACK) stop mysql

postgres-start:
	@$(DB_STACK) up -d --build postgres

postgres-stop:
	@$(DB_STACK) stop postgres

mssqlserver-start:
	@$(DB_STACK) up -d --build mssqlserver

mssqlserver-stop:
	@$(DB_STACK) stop mssqlserver

# Portainer commands
portainer-up:
	@$(PORTAINER) up -d --build

portainer-down:
	@$(PORTAINER) down -v

portainer-stop:
	@$(PORTAINER) stop

portainer-start:
	@$(PORTAINER) up -d

# Redis commands
redis-start:
	@$(DB_STACK) up -d --build redis

redis-stop:
	@$(DB_STACK) stop redis

redis-commander-start:
	@$(DB_STACK) up -d --build redis-commander

redis-commander-stop:
	@$(DB_STACK) stop redis-commander

# MongoDB commands
mongo-start:
	@$(DB_STACK) up -d --build mongodb

mongo-stop:
	@$(DB_STACK) stop mongodb

# Web stack commands
nginx-start:
	@$(WEB_STACK) up -d --build nginx

nginx-stop:
	@$(WEB_STACK) stop nginx
