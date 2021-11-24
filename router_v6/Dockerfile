FROM debian:bullseye-slim as router_v6
RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    iproute2 tshark iputils-ping iptables traceroute \
    && rm -rf /var/lib/apt/lists/*
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
ENV ROUTING ""
ENTRYPOINT ["entrypoint.sh"]
