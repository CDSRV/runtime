#!/usr/bin/env bash
set -x
set -a

. $WORKSPACE/etc/docker/login.properties

CONTAINER=$(docker ps -a --filter name=$NAME --format "{{.Names}}") ## INSTANCE:

[ $CONTAINER = $NAME ] && ( docker start $NAME; docker attach $NAME )

[ -z $CONTAINER ] && docker.run
docker ps -s -a --filter name=$NAME
