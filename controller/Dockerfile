ARG PREFIX

FROM ${PREFIX}/base-image

ENV TERM=xterm

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      etcd memcached mysql-client rabbitmq-server

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y keystone glance

ARG DB_HOST
ARG DB_PORT
ARG OS_MASTER_USERNAME
ARG OS_MASTER_PASSWORD

ARG DEFAULT_REGION
ARG GLANCE_IDENTITY
ARG KEYSTONE_IDENTITY
ARG NEUTRON_IDENTITY
ARG METADATA_SECRET
ARG NOVA_IDENTITY
ARG PLACEMENT_IDENTITY

ENV DB_HOST=${DB_HOST:-database} \
    DB_PORT=${DB_PORT:-3306} \
    OS_MASTER_USERNAME=${OS_MASTER_USERNAME} \
    OS_MASTER_PASSWORD=${OS_MASTER_PASSWORD} \
    DEFAULT_REGION=${DEFAULT_REGION:-RegionOne} \
    GLANCE_IDENTITY=${GLANCE_IDENTITY:-glance} \
    KEYSTONE_IDENTITY=${KEYSTONE_IDENTITY:-keystone} \
    METADATA_SECRET=${METADATA_SECRET:-qawsed123} \
    NEUTRON_IDENTITY=${NEUTRON_IDENTITY:-neutron} \
    NOVA_IDENTITY=${NOVA_IDENTITY:-nova} \
    PLACEMENT_IDENTITY=${PLACEMENT_IDENTITY:-placement}

VOLUME /var/lib/etcd
VOLUME /etc/keystone/fernet-keys
VOLUME /var/lib/glance
VOLUME /var/lib/nova
VOLUME /var/lib/rabbitmq

RUN DEBIAN_FRONTEND=nooninteractive apt-get install -y placement-api

RUN DEBIAN_FRONTEND=nooninteractive apt-get install -y nova-api nova-conductor nova-novncproxy nova-scheduler

RUN DEBIAN_FRONTEND=nooninteractive apt-get install -y neutron-server neutron-plugin-ml2 \
      neutron-linuxbridge-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent

RUN DEBIAN_FRONTEND=nooninteractive apt-get install -y openstack-dashboard

COPY etc /etc/

COPY initrc /initrc
RUN chmod +x /initrc

CMD /initrc
