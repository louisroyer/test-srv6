#!/usr/bin/env bash

# Add sid
ip sr tunsrc set fd00:51D5:0000:2::
ip link add sid type dummy
ip link set dev sid up
echo 100 localsid >> /etc/iproute2/rt_tables
ip -6 rule add to fd00:51D5:0000:2::/64 lookup localsid
ip -6 route add blackhole default table localsid
ip -6 route add fd00:51D5:0000:2:1::/80 encap seg6local action End dev sid table localsid proto static

# Add nei sid
ip -6 route add fd00:51D5:0000:1::/64 via fd00:d0cc:e700:1111:12::1 dev n12-0 proto static
ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:23::3 dev n23-0 proto static
ip -6 route add fd00:51D5:0000:4::/64 via fd00:d0cc:e700:1111:24::4 dev n24-0 proto static

