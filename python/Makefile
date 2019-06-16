# DOCKER_RUN_ALPINE has been added for creating .env file because
#		- trying to run a docker-compose command will fail if .env is not there
#				as service musketeers requires it
#		- when TravisCI generates this example with cookiecutter, the file owner stays root
#				and running `cp -f $(ENVFILE) .env` will result a permission denied error
DOCKER_RUN_ALPINE = docker run -v $(PWD):/opt/app -w /opt/app alpine
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
# ENVFILE is .env.template by default but can be overwritten
ENVFILE ?= .env.template

help:          ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all:
	ENVFILE=.env.example $(MAKE) envfile echo clean
.PHONY: all

envfile:       ## envfile creates or overwrites .env with $(ENVFILE)
	$(DOCKER_RUN_ALPINE) sh -c 'cp -f $(ENVFILE) .env'
.PHONY: envfile

removeEnvfile: ## remove .env
	$(DOCKER_RUN_ALPINE) sh -c 'rm -f .env'
.PHONY: removeEnvfile

echo:          ## echo calls the target _echo with the musketeers image
	$(COMPOSE_RUN_MUSKETEERS) make _echo
.PHONY: echo

shell:         ## shell allows you to enter a musketeers container
	$(COMPOSE_RUN_MUSKETEERS) sh -l
.PHONY: shell

clean:         ## clean the repository and docker environment
	docker-compose down --remove-orphans
	$(MAKE) removeEnvfile
.PHONY: clean

_echo:         ## _echo prints out ECHO_MESSAGE
	echo $(ECHO_MESSAGE)
.PHONY: _echo
