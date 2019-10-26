ARG PREFIX

FROM ${PREFIX}/base-image

ENV TERM=xterm

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libvirt-bin
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nova-compute
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neutron-linuxbridge-agent

ARG OS_MASTER_USERNAME
ARG OS_MASTER_PASSWORD

ARG DEFAULT_REGION
ARG NEUTRON_IDENTITY
ARG NOVA_IDENTITY
ARG PLACEMENT_IDENTITY

ENV OS_MASTER_USERNAME=${OS_MASTER_USERNAME} \
    OS_MASTER_PASSWORD=${OS_MASTER_PASSWORD} \
    DEFAULT_REGION=${DEFAULT_REGION:-RegionOne} \
    NEUTRON_IDENTITY=${NEUTRON_IDENTITY:-neutron} \
    NOVA_IDENTITY=${NOVA_IDENTITY:-nova} \
    PLACEMENT_IDENTITY=${PLACEMENT_IDENTITY:-placement}

VOLUME /var/lib/neutron
VOLUME /var/lib/nova


COPY etc /etc/

COPY initrc /initrc
RUN chmod +x /initrc

CMD /initrc
