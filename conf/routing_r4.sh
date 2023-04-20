#!/usr/bin/env bash

# Add sid
ip link add sid type dummy
ip link set dev sid up
ip -6 addr add fd00:51D5:0000:4:1::/128 dev sid # End
echo 100 localsid >> /etc/iproute2/rt_tables
ip -6 rule add to fd00:51D5:0000:4::/64 lookup localsid
ip -6 route add blackhole default table localsid
ip -6 route add fd00:51D5:0000:4:11::/80 encap seg6local action End.DX4 nh4 0.0.0.0 dev target-0 table localsid proto static

# Add nei sid
ip -6 route add fd00:51D5:0000:2::/64 via fd00:d0cc:e700:1111:24::2 dev n24-0 proto static
ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:34::3 dev n34-0 proto static

# Add sr route
ip route add 10.0.1.0/24 encap seg6 mode encap segs fd00:51D5:0000:2:1::,fd00:51D5:0000:1:11:: dev sid proto static
