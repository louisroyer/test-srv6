#!/usr/bin/env bash

# Add nei sid
ip -6 route add fd00:51D5:0002::/48 via fd00:d0cc:e700:1111:12::2 dev n12-0 proto static
ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:13::3 dev n13-0 proto static

# Add sr route
ip sr tunsrc set fd00:51D5:0000:1::
ip route add 10.0.2.0/24 encap seg6 mode encap segs fd00:51D5:0002:050a:004e:0200:1234:5678 dev linux-sr proto static
# 10.0.78.2 to hex = 0A.00.4E.02
