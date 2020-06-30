# https://github.com/Miroka96/docker-makefile

AUTHOR = miroka96
NAME = anton-cuda-ssh
TAG = 1.0

# either use volume name or absolute host path, eventually use ${PWD} for the current working directory
VOLUME = anton-cuda-data
MOUNTPATH = /data

LOCALPORT = 5001
CONTAINERPORT = 22

# if you want a special image name, edit this
IMAGE = $(AUTHOR)/$(NAME):$(TAG)

# if you have no volume, delete the right part
VOLUMEMOUNTING = -v $(VOLUME):$(MOUNTPATH)

# if you publish no ports, delete the right part
PORTPUBLISHING = -p $(LOCALPORT):$(CONTAINERPORT)

# if you do not link another container, delete the right part
CONTAINERLINKING =

# if you do not need to set environment variables, delete the right part
ENVIRONMENT =

# if you do not need to set CLI parameters for the executed program, delete the right part
CLI_PARAMETERS =

# if you do not need to set debug CLI parameters for the executed program, delete the right part
CLI_DEBUG_PARAMETERS =

DOCKERPARAMETERS = $(VOLUMEMOUNTING) $(PORTPUBLISHING) $(CONTAINERLINKING) $(ENVIRONMENT) --gpus all

.PHONY: build test test-shell build-test deploy build-deploy undeploy redeploy build-redeploy clean-volume clean-container clean install-dependencies configure

build:
	docker build -t $(IMAGE) .

build-nocache:
	docker build -t $(IMAGE) --no-cache .

test:
	docker run $(DOCKERPARAMETERS) -it --rm $(IMAGE) $(CLI_PARAMETERS) $(CLI_DEBUG_PARAMETERS)

test-shell:
	docker run $(DOCKERPARAMETERS) -it --rm $(IMAGE) /bin/bash

build-test: build test

deploy:
	docker run --detach --restart always --name=$(NAME) $(DOCKERPARAMETERS) $(IMAGE) $(CLI_PARAMETERS)

build-deploy: build deploy

undeploy:
	-docker stop $(NAME)
	docker rm $(NAME)

redeploy: undeploy deploy

build-redeploy: build redeploy

clean-volume:
	-docker volume rm $(VOLUME)

clean-container:
	-docker rm $(NAME)

clean: clean-volume clean-container

