FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN rm -rf /data/key && mkdir -p /data/key \ 
      && chown -R 1001:0 /data/key

VOLUME ["/data/key"]


COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


EXPOSE 27017

USER 1001

CMD ["mongod"]
