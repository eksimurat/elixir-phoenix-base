.PHONY: list start stop status sh
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
	$(COMPOSE) run --rm backend bash
