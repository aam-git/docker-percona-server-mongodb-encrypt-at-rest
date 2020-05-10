FROM percona/percona-server-mongodb
LABEL maintainer="AAMServices <info@aamservices.uk>"

USER root

RUN \
        yum -y update; yum clean all \
        && yum -y install centos-release-SCL; yum clean all \
          yum -y install openssl-devel openssl readline readline-devel gcc gcc-c++ ruby193-rubygems ruby193-rubygems-devel ruby193-ruby ruby193-ruby-devel; yum clean all \
        && rm -rf /data/key && mkdir -p /data/key \ 
        && chown -R 1001:0 /data/db

VOLUME ["/data/key"]

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER 1001

CMD ["mongod"]
