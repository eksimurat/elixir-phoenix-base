.PHONY: list start stop status sh all
.DEFAULT_GOAL := start

COMPOSE = docker-compose -p $(PROJECT)
PROJECT ?= II1305_PROJECT

list:
	@(grep -oe '^[[:lower:][:digit:]_\-]\{1,\}' Makefile | uniq)

start:
	$(COMPOSE) run --rm backend iex

stop:
	$(COMPOSE) stop

status:
	$(COMPOSE) ps

sh:
	$(COMPOSE) run --rm -p 5432:5432 -p 4000:4000 backend bash

all: 
	chmod +x entrypoint.sh
	./entrypoint.sh
