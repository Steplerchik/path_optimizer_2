#!/bin/bash

cd "$(dirname "$0")"
cd ../../..
export PRODUCTION_PATH=$PWD
export ARCH=`uname -m`
export NUM_THREADS=`nproc`

docker-compose --env-file $PRODUCTION_PATH/path_optimizer_2/docker/up.env \
    -f $PRODUCTION_PATH/path_optimizer_2/docker/up.yml \
    up $@