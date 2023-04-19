#!/usr/bin/env bash
#ip route add fd00:d0cc:e700:1111:2::/80 encap seg6 mode encap segs fd00:d0cc:e700:1111::3,fd00:d0cc:e700:1111:1::2 dev eth0
ip route add 10.0.2.0/24 encap seg6 mode encap segs fd00:d0cc:e700:1111:13::3,fd00:d0cc:e700:1111:34::4,fd00:51D5:0000:4:: dev n13-0 proto static

echo 100 localsid >> /etc/iproute2/rt_tables
ip -6 rule add to fd00:51D5:0000:1::/64 lookup localsid
ip -6 route add blackhole default table localsid
ip -6 route add fd00:51D5:0000:1::/128 encap seg6local action End.DX4 nh4 0.0.0.0 dev client-0 table localsid proto static
