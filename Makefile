COMMON_NAME = mysql_alpine

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
USER = root
PORTS = -p 3306:3306
PARAMS = -e MYSQL_DATABASE=mkay \
	-e MYSQL_USER=kvk \
	-e MYSQL_PASSWORD=1234 \
	-e MYSQL_ROOT_PASSWORD=111111
VOLUMES = \
	-v $$PWD:/app

.PHONY: build run stop inspect rm logs ports install test

build:
		docker build -t $(IMAGE) .

run:
		docker run --rm -it $(NET) --name $(NAME) --user $(USER) $(PORTS) $(PARAMS) $(VOLUMES) $(IMAGE)

install:
		docker run --rm -it $(NET) --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE) npm install --no-bin-links

test:
		docker exec -it $(NAME) npm test

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) sh

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)