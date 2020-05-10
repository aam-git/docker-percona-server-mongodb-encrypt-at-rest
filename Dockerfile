FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

USER root

RUN rm -rf /data/key && mkdir -p /data/key \ 
    && chown -R 1001:0 /data/db

VOLUME ["/data/key"]

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER 1001

CMD ["mongod"]
