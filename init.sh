#!/bin/bash

# exit script if return code != 0
set -e

echo "[info] Detecting configured host port"

HOST_PORT=`env |grep -i port |cut -f2 -d "="`

echo "[info] Detected host port is ${HOST_PORT}"

echo "[info] Detecting host Bridge interface IP..."

echo "[info] Detected IP is ${BRIDGE_IP}"

echo "[info] Starting podcats Web Server..."
/usr/local/bin/podcats serve /music --host ${BRIDGE_IP} --port ${HOST_PORT} --title "$PODCATS_TITLE"
