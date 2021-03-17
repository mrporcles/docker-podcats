#!/bin/bash

# exit script if return code != 0
set -e

echo "[info] Detecting IP..."

IP=`hostname -i`

echo "[info] Detected IP is ${IP}"

echo "[info] Starting podcats Web Server..."

/usr/local/bin/podcats serve /music --host ${DOCKER_HOST} --title "$PODCATS_TITLE"
