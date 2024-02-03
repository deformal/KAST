encrypt:
	@echo "Encrypting the envs"
	@chmod +x ./scripts/encrypt.envs.sh
	@./scripts/encrypt.envs.sh

decrypt:
	@echo "Encrypting the envs"
	@chmod +x ./scripts/decrypt.envs.sh
	@./scripts/decrypt.envs.sh
