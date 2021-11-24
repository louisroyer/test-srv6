#!/usr/bin/env bash
ip -6 r del default

if [ ! -z "$ROUTING_SRV6" ]; then
	/usr/bin/env $ROUTING_SRV6
fi
