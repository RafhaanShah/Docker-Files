#!/bin/bash

# From https://github.com/jenkinsci/docker/issues/196#issuecomment-179486312
# Run using sudo

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
REGULAR_USER="$(whoami)"

if [ -S "${DOCKER_SOCKET}" ]; then
    DOCKER_GID="$(stat -c '%g' "${DOCKER_SOCKET}")"
    groupadd -for -g ${DOCKER_GID} "${DOCKER_GROUP}"
    usermod -aG "${DOCKER_GROUP}" "${REGULAR_USER}"
fi

echo "You need to restart the container for this to take effect"
