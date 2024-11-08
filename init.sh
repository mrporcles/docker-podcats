#!/bin/sh

# exit script if return code != 0
set -e

if [ -z "${PODCATS_HOSTNAME}" ];
 then
    echo "[error] PODCATS_HOSTNAME environment variable not set"
    exit 1
 else
    echo "[info] PODCATS_HOSTNAME environment variable set to ${PODCATS_HOSTNAME}"
    echo "[info] Adding to hosts file"
    cp /etc/hosts /etc/hosts2
    sed -i '/^.* '${PODCATS_HOSTNAME}'$/b; 1s/.*/&\ '${PODCATS_HOSTNAME}'/' /etc/hosts2
    cat /etc/hosts2 > /etc/hosts
    rm /etc/hosts2
fi

echo "[info] Starting podcats Web Server..."
/usr/local/bin/podcats serve /music --host ${PODCATS_HOSTNAME} --title "${PODCATS_TITLE}"