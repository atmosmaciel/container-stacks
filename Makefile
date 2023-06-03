.IGNORE: install

DB_STACK=docker compose -f docker-compose-db-stack.yml
DOCKER_RUN=docker run

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

portainer-up:
	@$(DOCKER_RUN) -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

portainer-stop:
	docker stop portainer
