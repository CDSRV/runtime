#!/usr/bin/env bash
set -x

NAME=${1:-$(basename ${PWD})} ## MODEL:

CONTAINER=$(docker ps -a --filter name=$NAME --format "{{.Names}}") ## INSTANCE:

[[ $CONTAINER = $NAME ]] && ( docker start $NAME; docker attach $NAME ) && { exit; }


: ... building 

IMAGE=${IMAGE:-centos:latest}

# bind one workdir
[[ $ROOT = "/" ]] && ROOT=/tmp # prevent bind mounting / > / 
ROOT=${ROOT:-/root}
BASENAME=$(basename ${PWD})
WORKDIR=$ROOT/$BASENAME

# secure default
WORKDIR_MODE=${WORKDIR_MODE:-"ro"}
MOUNT_OPTIONS=",${WORKDIR_MODE}"

## TODO: use a named volume
[[ $WORKDIR_MODE = "rw" ]] && unset MOUNT_OPTIONS ## rw option undefined
MOUNT="type=bind,src="${PWD}",dst=${WORKDIR}${MOUNT_OPTIONS}"

docker run \
--name $NAME \
-w $WORKDIR \
--mount "${MOUNT}" \
-it $IMAGE /bin/bash
