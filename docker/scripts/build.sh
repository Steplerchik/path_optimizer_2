#!/bin/bash

cd "$(dirname "$0")"
cd ../../..
export PRODUCTION_PATH=$PWD
export ARCH=`uname -m`
export NUM_THREADS=`nproc`

POST_BUILD_SLEEP=1000 \
docker-compose --env-file $PRODUCTION_PATH/path_optimizer_2/docker/build.env \
    -f $PRODUCTION_PATH/path_optimizer_2/docker/build.yml \
    up --build $@