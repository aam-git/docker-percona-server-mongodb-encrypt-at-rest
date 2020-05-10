#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- mongod "$@"
fi

    if [ "$1" = 'mongod' ]; then
    
      if [ ! -f /data/key/mongodb.key ]; then
		cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 32 | head -n 1 | xargs printf '%s' | base64 | xargs printf '%s' > /data/key/mongodb.key
        chmod 600 /data/key/mongodb.key
      fi

      exec "$@"
    fi

exec "$@"
