#!/usr/bin/env bash

# Add nei sid
ip -6 route add fd00:51D5:0000:1::/64 via fd00:d0cc:e700:1111:13::1 dev n13-0 proto static
ip -6 route add fd00:51D5:0002::/48 via fd00:d0cc:e700:1111:23::2 dev n23-0 proto static
ip -6 route add fd00:51D5:0000:4::/64 via fd00:d0cc:e700:1111:55::4 dev ninter-0 proto static
