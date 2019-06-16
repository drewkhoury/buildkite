COMPOSE_BUILD_MUSKETEERS = docker-compose build --no-cache musketeers
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
ENVFILE ?= env.template

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all:            ## [envfile build test clean]
	ENVFILE=env.example $(MAKE) envfile build test clean

onPullRequest:  ## [build test clean] on PullRequest
	envfile build test clean

onMasterChange: ## [build test dockerhubBuild clean] on MasterChange
	envfile build test dockerhubBuild clean

envfile:        ## Copy envfile template to .env
	cp -f $(ENVFILE) .env

build:          ## Build the app
	$(COMPOSE_BUILD_MUSKETEERS)

test:           ## Test the app
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/test.sh

shell:          ## Run shell
	$(COMPOSE_RUN_MUSKETEERS)

clean:          ## Cleanup the environment
	docker-compose down --remove-orphans
	rm -f .env
