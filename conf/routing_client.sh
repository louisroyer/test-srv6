#!/usr/bin/env bash

ip route replace default via 10.0.1.1 dev client-0 proto static
