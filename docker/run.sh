#!/bin/bash
CURR_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

docker build ${CURR_DIR} -t ubuntu_vmath
docker run -it --volume=${CURR_DIR}/../:/code ubuntu_vmath /bin/bash
