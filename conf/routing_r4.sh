#!/usr/bin/env bash
ip route add  fd00:d0cc:e700:1111::/80 encap seg6 mode encap segs fd00:d0cc:e700:1111:2::3,fd00:d0cc:e700:1111:1::3 dev eth0
