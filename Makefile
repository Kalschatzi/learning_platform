.PHONY: default
default: help


.PHONY: init
init:
	git submodule update --init --recursive
	
.PHONY: help
help: Makefile
	@echo "Usage: "
	@sed -n 's/^##[ -]/   /p' Makefile
	@echo ""

.PHONY docker-build
docker-build:
	docker build . -t learn:latest  --build-arg HUGO_BASEURL=https://learn.kalschatzi.com

.PHONY docker-run
docker-run:
	docker compose up -d 

