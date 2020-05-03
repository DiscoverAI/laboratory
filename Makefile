DOCKER_IMAGE_NAME	:= laboratory
TOKEN				:= $(shell docker logs -t $(DOCKER_IMAGE_NAME) 2>&1 | awk 'match($$0, ".*token\=([a-zA-Z0-9]+)$$") {print substr($$0, RSTART+92, RLENGTH-92)}' | head -n 1)

.PHONY: hub
hub:
	- docker rm -f $(DOCKER_IMAGE_NAME)
		docker build -t $(DOCKER_IMAGE_NAME) .
		docker run -d -p 8888:8888 -v $(shell pwd)/notebooks:/home/jovyan/notebooks --name $(DOCKER_IMAGE_NAME) $(DOCKER_IMAGE_NAME)

.PHONY: login
login:
	echo "http://localhost:8888?token=$(TOKEN)"
