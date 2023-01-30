NAME=godock
SRC=github.com
TAG=go-dock

.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-_/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

app/init: ## Prepare your local dev environment
	cp .env.sample .env

docker/build: ## Build the docker image
	docker build \
		-f dockerfile/Dockerfile \
		--tag=$(TAG) \
		--no-cache \
		--build-arg GITHUB_ACCESS_TOKEN .

docker/rm: ## Deletes the docker image
	docker image rm $(TAG)

docker/up: ## Start Docker containers
	docker-compose up $(NAME)

docker/down: ## Stop Docker containers
	docker-compose down

docker/bash: ## Provide bash access on Rails container
	docker-compose exec -w /go/src/$(SRC)/$(TAG) godock zsh

# Go Commands
go/mod/download: ## Download packages
	docker-compose exec -w /go/src/$(SRC)/$(TAG) godock bundle install
