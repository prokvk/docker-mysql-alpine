#!/usr/bin/env sh

DIR=$(readlink -f "$0")
PWD=$(dirname $DIR)

exec /usr/bin/docker run --rm --name mysql -p 3306:3306 \
	-v $PWD:/app \
	-v /usr/local/src/mysql_data:/var/lib/mysql \
	-e MYSQL_DATABASE=mkay \
	-e MYSQL_USER=kvk \
	-e MYSQL_PASSWORD=1234 \
	-e MYSQL_ROOT_PASSWORD=111111 \
	mysql