FROM mariadb:latest

ADD /tables/ /docker-entrypoint-initdb.d/tables/
ADD /inserts/ /docker-entrypoint-initdb.d/inserts/
ADD deploy_schemas.sql /docker-entrypoint-initdb.d/