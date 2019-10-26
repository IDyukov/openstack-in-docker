ARG ORIGIN_IMAGE

FROM ${ORIGIN_IMAGE}

ENV TERM=xterm

RUN DEBIAN_FRONTEND=nooninteractive \
    apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends mariadb-server && \
    apt-get clean

ARG OS_MASTER_USERNAME
ENV OS_MASTER_USERNAME=${OS_MASTER_USERNAME}
ARG OS_MASTER_PASSWORD
ENV OS_MASTER_PASSWORD=${OS_MASTER_PASSWORD}

COPY 99-openstack.cnf /etc/mysql/mariadb.conf.d/

VOLUME /var/lib/mysql

CMD chown -R mysql:mysql /var/lib/mysql || exit -1; \
    [ ! -d /var/lib/mysql/mysql ] && { \
      echo -n " * Initializing database... "; \
      mysql_install_db || exit -1; \
      echo "done."; \
    }; \
    service mysql start && \
    [ $(mysql mysql -e "SELECT user FROM user;" | grep -c "\b${OS_MASTER_USERNAME}\b") -lt 1 ] && { \
      echo -n " * Creating MariaDB master user... "; \
      mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${OS_MASTER_USERNAME}'@'%' IDENTIFIED BY '${OS_MASTER_PASSWORD}' WITH GRANT OPTION;" && \
      echo "done."; \
    }; \
    exec sleep infinity
