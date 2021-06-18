#!/usr/bin/env bash

## PURPOSE: convenience function
## REF: https://docs.docker.com/engine/reference/commandline/start/
## REF: https://docs.docker.com/engine/reference/commandline/attach/

set -a

case_debug

. $WORKSPACE/etc/docker/login.properties

CONTAINER=$(docker ps -a --filter name=$NAME --format "{{.Names}}") ## this returns 0 even if no container is found

[ -z $CONTAINER ] && { docker.run; exit $?; }

[ -z $CONTAINER ] || ( docker start $NAME && docker attach $NAME )
