FROM percona/percona-server-mongodb:4.2
LABEL maintainer="AAMServices <info@aamservices.uk>"

USER root

RUN rm -rf /data/key && mkdir -p /data/key \ 
    && chown -R 1001:1001 /data/key 

VOLUME ["/data/key"]

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER 1001

CMD ["mongod", "--enableEncryption", "--encryptionKeyFile", "/data/key/mongodb.key", "--bind_ip_all"]
