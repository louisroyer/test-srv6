FROM golang:1.18 AS builder

ARG NEXTMNSR_RELEASE
RUN : ${NEXTMNSR_RELEASE:? Missing build-arg NEXTMNSR_RELEASE.} && GOPRIVATE=github.com/louisroyer/nextmn-srv6 go install github.com/louisroyer/nextmn-srv6@${NEXTMNSR_RELEASE}

FROM debian:bullseye-slim as router_v6_nextmn
RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    iproute2 tshark iputils-ping iptables traceroute procps iperf3 netcat \
    && rm -rf /var/lib/apt/lists/*
COPY --from=builder /go/bin/nextmn-srv6 /usr/local/sbin/nextmn-srv6
ENTRYPOINT ["nextmn-srv6"]
CMD ["--help"]

FROM debian:bullseye-slim as router_v6_nextmn_dev
RUN apt-get update && DEBIAN_FRONTEND=non-interactive apt-get install -qy --no-install-recommends --no-install-suggests \
    iproute2 tshark iputils-ping iptables traceroute procps iperf3 netcat \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["nextmn-srv6"]
CMD ["--help"]

