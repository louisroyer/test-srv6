#!/usr/bin/env bash
ip -6 r del default
ip -4 r del default

if [ -n "$ROUTING_SRV6" ]; then
	"$ROUTING_SRV6"
fi
