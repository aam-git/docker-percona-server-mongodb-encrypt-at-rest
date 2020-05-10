FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

USER root

RUN \
        apt-get update \
        && apt-get install -y --force-yes \
          openssl \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /data/key && mkdir -p /data/key \ 
        && chown -R 1001:0 /data/db

VOLUME ["/data/key"]

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER 1001

CMD ["mongod"]
