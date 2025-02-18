.PHONY: default
default: help

.PHONY: help
help: Makefile
	@awk -F ':.*#' '/^[a-zA-Z0-9_-]+:/ { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }' Makefile

.PHONY: init
init:
	@git submodule update --init --recursive

.PHONY: docker-build
docker-build:  # Build the Docker image
	@docker build . -t learn:latest  --build-arg HUGO_BASEURL="https://learn.kalschatzi.com"

.PHONY: docker-run
docker-run:  # Run Docker compose
	@docker compose up -d --build  

.PHONY: run
run:
	@hugo serve
