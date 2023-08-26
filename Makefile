.PHONY: build publish stop run package frontend bindir api apackage abuild
DOCKER_IMAGE_OWNER = enf3rno
DOCKER_IMAGE_NAME = sg_nginx
BUILD_NUMBER = 1
DOCKER_IMAGE_FULL = $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME):$(BUILD_NUMBER)
DOCKER_LOGIN_USERNAME =
DOCKER_LOGIN_PASSWORD =

all: build run

docker:
	@docker image build -f ./Dockerfile -t $(DOCKER_IMAGE_FULL) .
publish:
	@docker login -u $(DOCKER_LOGIN_USERNAME) -p $(DOCKER_LOGIN_PASSWORD)
	@docker image push $(DOCKER_IMAGE_FULL)


