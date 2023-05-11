#!/usr/bin/env bash

# Add nei sid
ip -6 route add fd00:51D5:0000:2::/64 via fd00:d0cc:e700:1111:12::2 dev n12-0 proto static
ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:13::3 dev n13-0 proto static

# Add sr route
ip route add 10.0.2.0/24 encap seg6 mode encap segs fd00:51D5:0000:3:1::,fd00:51D5:0000:4:11:: dev linux-sr proto static

