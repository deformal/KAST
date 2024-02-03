cwd:
	@echo $(BASE_PATH)

server-run:
	@echo "Running server locally"
	@go run ./src/main.go

encrypt:
	@echo "Encrypting the envs"
	@chmod +x ./scripts/encrypt.envs.sh
	@./scripts/encrypt.envs.sh

decrypt:
	@echo "Encrypting the envs"
	@chmod +x ./scripts/decrypt.envs.sh
	@./scripts/decrypt.envs.sh

hasura-up:
	@echo "Starting Hasura services"
	@chmod +x ./docker/docker.compose.yml
	@docker compose -f $(PWD)/docker/docker.compose.yml up --build -d

hasura-down:
	@echo "Starting Hasura services"
	@chmod +x ./docker/docker.compose.yml
	@docker compose -f $(PWD)/docker/docker.compose.yml down

hasura-clean:
	@echo "Starting Hasura services"
	@chmod +x ./docker/docker.compose.yml
	@docker compose -f $(PWD)/docker/docker.compose.yml down -v

hasura-console:
	@echo "Starting Hasura Console"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.development console

hasura-mig-apply:
	@echo "applying migrations"
	@echo "Choosen Stage => $(stage)"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) migrate apply

hasura-meta-apply:
	@echo "applying migrations"
	@echo "Choosen Stage => $(stage)"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) metadata apply


hasura-mig-apply-version:
	@echo "Applying spcific migrations"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) migrate apply --version $(version)

hasura-mig-rollback-version:
	@echo "Rolling back spcific migrations"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) migrate apply --version $(version) --type down

hasura-mig-rollback-number-of-versions:
	@echo "Rolling back spcific migrations"
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) migrate apply down $(count)

hasura-mig-status:
	@hasura --project=$(PWD)/hasura --envfile=$(PWD)/.env.$(stage) migrate status