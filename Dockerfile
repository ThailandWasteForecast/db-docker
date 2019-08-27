FROM mysql:5.7
LABEL maintainer chonnarong@nonagon.co.th
# ENV MYSQL_ROOT_PASSWORD unset
COPY ./my.cnf /etc/mysql/conf.d/my.cnf
WORKDIR /docker-entrypoint-initdb.d