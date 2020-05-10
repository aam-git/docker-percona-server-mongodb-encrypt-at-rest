#!/bin/bash
set -e
FILE = /data/key/mongodb.key

if [ "${1:0:1}" = '-' ]; then
	set -- mongod "$@"

if [ "$1" = 'mongod' ]; then

    if [ !-f "$FILE" ]; then
        mkdir /data/key
		openssl rand -base64 32 > /data/key/mongodb.key
		chmod 600 /data/key/mongodb.key
    fi

    exec "$@"
fi

exec "$@"