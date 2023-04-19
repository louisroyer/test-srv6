#!/usr/bin/env bash

ip -6 route add fd00:51D5:0000:3::/64 via fd00:d0cc:e700:1111:55::3 dev ninter-0 proto static
ip -6 route add fd00:51D5:0000:4::/64 via fd00:d0cc:e700:1111:34::4 dev n34-0 proto static
