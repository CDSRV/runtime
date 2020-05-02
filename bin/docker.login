#!/usr/bin/env bash
set -x

NAME=${1:-$(basename ${PWD})} ## MODEL:

CONTAINER=$(docker ps -a --filter name=$NAME --format "{{.Names}}") ## INSTANCE:

[ $CONTAINER = $NAME ] && ( docker start $NAME; docker attach $NAME )

[ -z $CONTAINER ] && docker.run
