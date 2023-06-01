#!/usr/bin/env bash

# Add nei sid
ip -6 route add fd00:51D5:0000:2::/64 via fd00:d0cc:e700:1111:24::2 dev n24-0 proto static
ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:34::3 dev n34-0 proto static

# Add sr route
ip sr tunsrc set fd00:51D5:0000:4::
ip route add 10.0.1.0/24 encap seg6 mode encap segs fd00:51D5:0000:2:1::,fd00:51D5:0000:1:11:: dev linux-sr proto static
