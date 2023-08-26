.PHONY: build publish stop run package frontend bindir api apackage abuild
DOCKER_IMAGE_OWNER = enf3rno
DOCKER_IMAGE_NAME = sg_nginx
DOCKER_IMAGE_VERSION = 1
DOCKER_IMAGE_FULL = $(DOCKER_IMAGE_OWNER)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
DOCKER_LOGIN_USERNAME =
DOCKER_LOGIN_PASSWORD =

all: build run

docker:
	@docker image build -f ./Dockerfile -t $(DOCKER_IMAGE_FULL) .
publish:
	@docker login -u $(DOCKER_LOGIN_USERNAME) --password-stdin $(DOCKER_LOGIN_PASSWORD)
	@docker image push $(DOCKER_IMAGE_FULL)


