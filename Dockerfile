FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


EXPOSE 27017

USER 1001

CMD ["mongod"]
