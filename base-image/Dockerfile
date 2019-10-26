ARG ORIGIN_IMAGE

FROM ${ORIGIN_IMAGE}

ENV TERM=xterm

RUN DEBIAN_FRONTEND=nooninteractive \
    apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
      apt-utils bash-completion ca-certificates curl less netcat net-tools psmisc software-properties-common tcpdump vim

ARG OS_CODENAME
ENV OS_CODENAME=${OS_CODENAME}

RUN add-apt-repository cloud-archive:${OS_CODENAME} && \
    apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install -y python3-openstackclient && \
    apt-get clean

# - pretify root CLI -
COPY aux/ /root/

# - helper -
COPY bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD true
