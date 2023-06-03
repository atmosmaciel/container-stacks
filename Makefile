RUN=docker run
STOP=docker stop
DB_STACK=docker compose -f docker-compose-db-stack.yml
WEB_STACK=docker compose -f docker-compose-web-stack.yml

db-stack-up:
	@$(DB_STACK) up --build --remove-orphans

db-stack-down:
	@$(DB_STACK) down -v

db-stack-stop:
	@$(DB_STACK) stop -v

mysql8-start:
	@$(DB_STACK) up mysql8

mysql8-stop:
	@$(DB_STACK) stop mysql8

postgres-start:
	@$(DB_STACK) up postgres

postgres-stop:
	@$(DB_STACK) stop postgres

mssqlserver-start:
	@$(DB_STACK) up mssqlserver

mssqlserver-stop:
	@$(DB_STACK) stop mssqlserver

portainer-start:
	@$(RUN) -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

portainer-stop:
	@$(STOP) portainer

redis-start:
	@$(RUN) -d --name redis-stack-server -p 6379:6379 redis/redis-stack-server:latest

redis-stop:
	@$(STOP) redis-stack-server

mongo-start:
	@$(DB_STACK) up mongodb

mongo-stop:
	@$(DB_STACK) stop mongodb

nginx-start:
	@$(WEB_STACK) up nginx

nginx-stop:
	@$(WEB_STACK) stop nginx
