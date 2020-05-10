#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- mongod "$@"
fi

    if [ "$1" = 'mongod' ]; then

      if [ ! -d /data/key ]; then
        mkdir /data/key
        openssl rand -base64 32 > /data/key/mongodb.key
        chmod 600 /data/key/mongodb.key
        sed -i '/#security/a\  enableEncryption: true\n  encryptionKeyFile: /data/key/mongodb.key' /etc/mongod.conf
      fi

      exec "$@"
    fi

exec "$@"
