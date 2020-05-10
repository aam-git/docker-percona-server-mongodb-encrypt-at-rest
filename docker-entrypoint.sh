#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- mongod "$@"
fi

    if [ "$1" = 'mongod' ]; then

        cat /dev/urandom | tr -dc A-Z0-9 | fold -w 32 | head -n 1 | base64 > /data/key/mongodb.key
      if [ ! -f /data/key/mongodb.key ]; then
        chmod 600 /data/key/mongodb.key
      fi

      exec "$@"
    fi

exec "$@"
