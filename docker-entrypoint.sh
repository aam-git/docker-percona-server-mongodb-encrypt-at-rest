#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- mongod "$@"
fi

    if [ "$1" = 'mongod' ]; then

      if [ !-f "/data/key/mongodb.key" ]; then
        mkdir /data/key
        openssl rand -base64 32 > /data/key/mongodb.key
        chmod 600 /data/key/mongodb.key
      fi

      exec "$@"
    fi

exec "$@"
