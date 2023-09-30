##
# Project Title
#
# @file
# @version 0.1

SHELL     := /bin/bash
BUILD_KEY ?= $(HOME)/.ssh/id_ed25519.pub
# add your ssh key in here

ifndef CI_BUILD

REQUIRE     = awk date docker git grep docker-compose ipcalc jq pre-commit pip yq
CHK_REQUIRE := $(foreach e,$(REQUIRE), \
	$(if $(shell command -v $(e)),, $(error No <$(e)> in PATH)))

endif

author      := onid3Mon37 <onidemon37@protonmail.com>;
maintainers := onid3Mon37 <onidemon37@protonmail.com>, bmtolentino <bmtolentino@gmail.com>, Shilvan <5.shilvandacost@gmail.com>;
version     := 0.1.0
function    := Deployment of the backend

APP_DEPLOY_TYPE ?= docker
APP_LANG        ?= nodejs
APP_NAME_PREFIX := andorigna
APP_NAME        ?= $(APP_NAME_PREFIX)-
APP_SRC         ?= ./
APP_BUILD_FLAGS ?=
APP_BUILD_ENV   ?=

TAG ?=

DOCKER_PLATFORM := linux/amd64
DOCKER_REG      ?= ghcr.io
DOCKER_UOR      ?= $(DOCKER_REG)/twd
DOCKER_IMG_TAG  ?= latest

PATH_PKGS ?=

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
BLUE   := $(shell tput -Txterm setaf 4)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=30

# Dynamic list of directory which represents the application type. It's not
# predefined and is able to grow.
#APP_TYPES := $(subst generic,,$(subst ./client/,,$(wildcard ./server/*)))

all: help

## Show help
help:
	@echo ''
	@printf "%0.s-" {1..110}
	@echo ''
	@echo '${YELLOW}Author		: ${GREEN}$(author)${RESET}'
	@echo '${YELLOW}Maintainers	: ${GREEN}$(maintainers)${RESET}'
	@echo '${YELLOW}Version		: ${GREEN}$(version)${RESET}'
	@echo '${YELLOW}Function	: ${GREEN}$(function)${RESET}'
	@printf "%0.s-" {1..110}
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

# ------------------------------------------------------------------------------


# End of Makefile
