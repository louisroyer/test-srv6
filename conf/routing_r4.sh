#!/usr/bin/env bash
#ip route add  fd00:d0cc:e700:1111::/80 encap seg6 mode encap segs fd00:d0cc:e700:1111:2::3,fd00:d0cc:e700:1111:1::3 dev eth0
ip route add 10.0.1.0/24 encap seg6 mode encap segs fd00:d0cc:e700:1111:24::2,fd00:d0cc:e700:1111:12::1,fd00:51D5:0000:1:: dev n24-0 proto static

echo 100 localsid >> /etc/iproute2/rt_tables
ip -6 rule add to fd00:51D5:0000:4::/64 lookup localsid
ip -6 route add blackhole default table localsid
ip -6 route add fd00:51D5:0000:4::/128 encap seg6local action End.DX4 nh4 0.0.0.0 dev target-0 table localsid proto static
