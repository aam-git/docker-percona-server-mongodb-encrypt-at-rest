### powered by [percona-server-mongodb][1]

[Percona Server for MongoDB][2] ® is a free, enhanced, fully compatible, open source, drop-in replacement for the MongoDB® Community Edition that includes enterprise-grade features and functionality.

------------


The only changes i've mde from the original image is to add the encryption options and a system to locally generate an encryption key.

**IMPORTANT: MAKE SURE TO BACKUP YOUR /data/key/mongodb.key FILE!! 
You could lose your data without it.**

## docker-compose.yml

```yaml
version: '2'
services:
  mongo:
    image: aamservices/percona-server-mongodb-encrypt-at-rest
    restart: unless-stopped
    networks:
      - internal
    volumes:
      - database_data:/data/db
      - database_key:/data/key
volumes:
  database_data:
    driver: local
  database_key:
    driver: local
```


[1]: https://hub.docker.com/r/percona/percona-server-mongodb
[2]: https://www.percona.com/software/mongodb/percona-server-for-mongodb
