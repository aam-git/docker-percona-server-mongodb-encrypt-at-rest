FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

COPY ./docker-entrypoint.sh /

EXPOSE 27017

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mongod"]
